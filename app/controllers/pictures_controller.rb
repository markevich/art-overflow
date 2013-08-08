class PicturesController < ApplicationController
  PAGE_SIZE = 15
  before_filter :set_model, only: [:show, :like, :unlike]

  def index
    @page = (params[:page] || 1).to_i
    offset = (@page - 1) * PAGE_SIZE
    @pictures = Picture.limit(PAGE_SIZE).offset(offset)

    render @pictures if request.xhr?
  end

  def new
    @picture = Picture.new
  end

  def show
    @picture = Picture.find(params[:id])
    @comments = @picture.comments.includes(:user)
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
    render nothing: true
  end

  def unlike
    current_user.unvote_for @picture
    render nothing: true
  end

  private

  def set_model
    @picture = Picture.find params[:id]
  end

  def permitted_params
    params.require(:picture).permit(:name, :path, :tag_list)
  end

end
