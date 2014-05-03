class CommentsController < InheritedResources::Base
  before_filter :authenticate_user!

  actions :all, except: [:new, :index]

  def smart_resource_url
    url_for resource.commentable
  end

  def smart_collection_url
    url_for resource.commentable
  end

  def like
    if current_user.like(resource)
      render json: { count: resource.reload.likes_count, state: :active }
    else
      render json: { count: resource.reload.likes_count, message: 'fail', state: :inactive}
    end
  end

  def unlike
    if current_user.unlike(resource)
      render json: { count: resource.reload.likes_count, state: :inactive }
    else
      render json: { count: resource.reload.likes_count, message: 'fail', state: :active}
    end
  end

  def permitted_params
    params.permit(comment: [:text, :commentable_id, :commentable_type]).tap do |wl|
      wl[:comment] ||= {}
      wl[:comment][:user_id] = current_user.id
    end.permit!
  end
end
