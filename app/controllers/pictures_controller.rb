class PicturesController < ApplicationController
  PAGE_SIZE = 15
  before_filter :set_model, only: [:show, :like, :unlike]
  before_filter :set_cookies_page_size, only: [:index]

  def index
    params[:page] ||= 1
    offset = (params[:page].to_i - 1) * PAGE_SIZE
    @pictures = Picture.limit(PAGE_SIZE).offset(offset)

    render @pictures if request.xhr?
  end

  def new
    @picture = Picture.new
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments.with_state([:draft, :published]).nested_set
  end

  def create
    params = {user: current_user}.merge permitted_params
    picture = Picture.create params

    picture.tag_list = params["tag_list"].split.join(", ")
    picture.save
    redirect_to picture
  end

  def like
    current_user.vote_for @picture
    @picture.create_activity :like
    redirect_to action: :show
  end

  def unlike
    current_user.unvote_for @picture
    @picture.activities.where(key: 'picture.like', owner: current_user).first.destroy
    redirect_to action: :show
  end

  private

  def set_model
    @picture = Picture.find params[:id]
  end

  def set_cookies_page_size
    cookies[:page_size] = PAGE_SIZE
  end

  def permitted_params
    params.require(:picture).permit(:name, :path, :tag_list)
  end

end
