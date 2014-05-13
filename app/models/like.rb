class Like < ActiveRecord::Base
  include Trackable

  belongs_to :likeable, polymorphic: true, counter_cache: true, touch: true
  belongs_to :user, touch: true

  validates :user, :likeable, presence: true

  def recipient
    likeable.user
  end
end
