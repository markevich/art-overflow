module Api
  class ProjectEmotionsController < ActionController::Base
    respond_to :json

    def index
      @project = Picture.find(params[:project_id])
      @emotions = @project.emotions
      respond_with @emotions
    end
  end
end
