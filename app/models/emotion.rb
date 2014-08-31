class Emotion < ActiveRecord::Base
  belongs_to :picture, touch: true
  belongs_to :user

  validates :picture, :user, :type, presence: true
end
