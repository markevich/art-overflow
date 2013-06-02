class PicturesController < ApplicationController
  before_filter :set_model, only: [:show, :like, :unlike]

  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def show
     @picture = Picture.find(params[:id])
  end

  def create
    params = {user: current_user}.merge permitted_params.picture
    picture = Picture.create params
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

end
