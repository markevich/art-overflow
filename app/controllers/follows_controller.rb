class FollowsController < InheritedResources::Base
  before_action :authenticate_user!, except: :index

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

  helper_method :collection

  private

  def collection
    @collection ||= begin
      end_of_association_chain.includes(:followable).order(created_at: :desc)
    end
  end
end
