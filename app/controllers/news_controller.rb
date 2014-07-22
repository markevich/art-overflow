class NewsController < InheritedResources::Base
  load_and_authorize_resource :news

  protected

  def collection
    @collection ||= end_of_association_chain.published
  end

  def permitted_params
    params.permit(news: [:title, :body, :published, :picture, :short_body])
  end
end
