class Follow < ActiveRecord::Base
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  include Trackable

  belongs_to :followable, polymorphic: true, touch: true
  belongs_to :follower, polymorphic: true, touch: true

  after_create :send_notification

  def recipient
    followable
  end

  private

  def send_notification
    NotificationWorker.perform_async(:new_follower, id)
  end
end
