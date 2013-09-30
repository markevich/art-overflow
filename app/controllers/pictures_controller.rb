class PicturesController < ApplicationController
  PAGE_SIZE = 15
  before_filter :set_model, only: [:show, :like, :unlike]
  # before_filter :authenticate!, only: [:like, :unlike]

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
    if user_signed_in?
      @voted = current_user.liked?(@picture)
      @following = current_user.following?(@picture.user)
      @current_user_id = current_user.id
    end
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
    current_user.like(@picture)
    render text: @picture.reload.likes_count
  end

  def unlike
    current_user.unlike(@picture)
    render text: @picture.reload.likes_count
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
