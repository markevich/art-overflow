module Api
  class ProjectEmotionsController < ActionController::Base
    respond_to :json

    def index
      @project = Picture.find(params[:project_id])
      @emotions = @project.emotions
    end

    def create
      Emotion.create!(permitted_params)
      render nothing: true
    end

    def permitted_params
      Rails.logger.info(params)
      params.permit(:project_id, :user_id, :type).tap do |p|
        p[:picture_id] = p.delete(:project_id)
      end.permit!
    end
  end
end
