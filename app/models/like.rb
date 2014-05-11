class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true, counter_cache: true, touch: true
  belongs_to :user, touch: true

  validates :user, :likeable, presence: true
end
