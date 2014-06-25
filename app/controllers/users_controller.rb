class UsersController < InheritedResources::Base
  before_filter :authenticate_user!, only: [:edit, :update, :follow, :stop_following]

  load_and_authorize_resource
  actions :all, except: [:index, :show]

  def permitted_params
    params.permit(user:[
      :name, :city, :vk, :slug
    ])
  end

  def method_for_find
    :friendly_find
  end
end
