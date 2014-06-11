class LikesController < InheritedResources::Base
  before_action :authenticate_user!
  belongs_to :comment, :picture, polymorphic: true

  def create
    like = Like.new(likeable: parent, user: current_user)

    if like.save
      render json: { count: parent.reload.likes_count, state: :active }
    else
      render json: { count: parent.reload.likes_count, message: 'fail', state: :inactive}
    end
  end

  def destroy
    like = Like.find_by(likeable: parent, user: current_user)

    if like && like.destroy
      render json: { count: parent.reload.likes_count, state: :inactive }
    else
      render json: { count: parent.reload.likes_count, message: 'fail', state: :active}
    end
  end
end
