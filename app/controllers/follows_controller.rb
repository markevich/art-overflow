class FollowsController < InheritedResources::Base
  before_action :authenticate_user!
  belongs_to :user

  def create
    if current_user.follow(parent)
      render json: { count: parent.reload.followers_count, state: :active }
    else
      render json: { count: parent.reload.followers_count, state: :inactive }
    end
  end

  def destroy
    if current_user.stop_following(parent)
      render json: { count: parent.reload.followers_count, state: :inactive }
    else
      render json: { count: parent.reload.followers_count, state: :active }
    end
  end
end
