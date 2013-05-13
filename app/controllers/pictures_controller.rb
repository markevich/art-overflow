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
    picture = Picture.create permitted_params.picture
    redirect_to picture
  end

end
