class PicturesController < ApplicationController
  PAGE_SIZE = 15
  before_filter :set_model, only: [:show, :like, :unlike]
  before_filter :set_page_and_offset, only: [:index, :latest_list, :popular_list]
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :like, :unlike]

  def index
    @pictures = Picture.includes(:user).limit(PAGE_SIZE).offset(@offset)

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
    @picture = Picture.new(permitted_params)
    flash[:notice] = "Picture was succesfully created." if @picture.save

    respond_with @picture
  end

  def like
    if current_user.like(@picture)
      render json: { count: @picture.reload.likes_count, state: :active }
    else
      render json: { count: @picture.reload.likes_count, message: 'fail', state: :inactive}
    end
  end

  def unlike
    if current_user.unlike(@picture)
      render json: { count: @picture.reload.likes_count, state: :inactive }
    else
      render json: { count: @picture.reload.likes_count, message: 'fail', state: :active}
    end
  end

  def latest
    @user = User.find(params[:user_id])
    @pictures = @user.pictures_latest.limit(PAGE_SIZE).offset(@offset)
    # respond_to do |format|
    #   format.js { render @pictures }
    #   format.html { render 'users/show' }
    # end

    if request.xhr?
      render @pictures
    else
      render 'users/show'
    end
  end

  # def latest_list
  #   @user = User.find(params[:user_id])
  #   @pictures = @user.pictures_latest.limit(PAGE_SIZE).offset(@offset)

  #   render @pictures
  # end

  def popular
    @user = User.find(params[:user_id])
    @pictures = @user.pictures_popular.limit(PAGE_SIZE).offset(@offset)

    if request.xhr?
      render @pictures
    else
      render 'users/_popular'
    end
  end

  # def popular_list
  #   @user = User.find(params[:user_id])
  #   @pictures = @user.pictures_popular.limit(PAGE_SIZE).offset(@offset)

  #   render @pictures
  # end

  private

  def set_model
    @picture = Picture.find params[:id]
  end

  def set_page_and_offset
    @page = (params[:page] || 1).to_i
    @offset = (@page - 1) * PAGE_SIZE
  end

  def permitted_params
    params.require(:picture).permit(
      :crop_x,
      :crop_y,
      :crop_h,
      :crop_w,
      :name,
      :description,
      :path,
      :tag_list
    ).tap do |whitelist|
      whitelist[:user] = current_user
    end.permit!
  end
end
