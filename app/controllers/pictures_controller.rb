class PicturesController < ApplicationController
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

end
