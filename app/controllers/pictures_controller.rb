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
    @voted = current_user.voted_on?(@picture)
    @following = current_user.following?(@picture.user)
  end

  def create
    picture_params = permitted_params.merge({ user: current_user })

    picture_params['tag_list'] = picture_params['tag_list'].split.join(", ")

    picture = Picture.new(picture_params)

    if picture.save()
      redirect_to picture
    else
      #TODO add flashes
      raise
    end
  end

  def like
    current_user.vote_for @picture
    render text: @picture.votes_count
  end

  def unlike
    current_user.unvote_for @picture
    render text: @picture.votes_count
  end

  private

  def set_model
    @picture = Picture.find params[:id]
  end

  def permitted_params
    params.require(:picture).permit(
      :name,
      :path,
      :tag_list
    )
  end

end
