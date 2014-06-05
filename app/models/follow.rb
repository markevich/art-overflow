class Follow < ActiveRecord::Base
  extend ActsAsFollower::FollowerLib
  extend ActsAsFollower::FollowScopes

  include Trackable

  belongs_to :followable, polymorphic: true, touch: true
  belongs_to :follower, polymorphic: true, touch: true
  alias_method :activity_owner, :follower

  def recipient
    followable
  end
end
