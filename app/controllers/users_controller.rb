class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:edit, :update, :follow, :stop_following]

  load_and_authorize_resource
  actions :all, except: [:index, :show]

  def follow
    if current_user.follow(resource)
      render json: { count: resource.reload.followers_count, state: :active }
    else
      render json: { count: resource.reload.followers_count, state: :inactive }
    end
  end

  def stop_following
    if current_user.stop_following(resource)
      render json: { count: resource.reload.followers_count, state: :inactive }
    else
      render json: { count: resource.reload.followers_count, state: :active }
    end
  end

  def permitted_params
    params.permit(user:[
      :name, :city, :vk
    ])
  end
end
