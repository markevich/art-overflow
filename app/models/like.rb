class Like < ActiveRecord::Base
  include Trackable

  belongs_to :likeable, polymorphic: true, counter_cache: true, touch: true
  belongs_to :user, touch: true

  validates :user, :likeable, presence: true
  validates :user, uniqueness: { scope: [:likeable_id, :likeable_type] }

  delegate :name, :avatar, to: :user, prefix: true

  alias_method :activity_owner, :user

  def recipient
    likeable.user
  end
end
