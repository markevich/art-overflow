class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!

  actions :all, except: [:new, :index]

  def smart_resource_url
    url_for resource.commentable
  end

  def smart_collection_url
    url_for resource.commentable
  end

  def permitted_params
    params.permit(comment: [:text, :commentable_id, :commentable_type]).tap do |wl|
      wl[:comment] ||= {}
      wl[:comment][:user_id] = current_user.id
    end.permit!
  end
end
