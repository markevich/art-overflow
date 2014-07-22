class NewsController < InheritedResources::Base
  def permitted_params
    params.permit(news: [:title, :body, :published, :picture, :short_body])
  end
end
