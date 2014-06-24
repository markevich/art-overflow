class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{params[:term]}%").pluck(:name)
    respond_to do |format|
      format.json { render json: @tags }
      format.html { redirect_to root_path }
    end
  end
end