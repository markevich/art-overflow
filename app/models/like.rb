class Like < ActiveRecord::Base
  belongs_to :likeable, polymorphic: true, counter_cache: true
  belongs_to :user

  validates :user, :likeable, presence: true
end
