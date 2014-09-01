class Emotion < ActiveRecord::Base
  TYPES = [Wtf.to_s, Cute.to_s, Facepalm.to_s, Inspiration.to_s, Rapture.to_s].freeze
  belongs_to :picture, touch: true
  belongs_to :user

  validates :picture, :user, :type, presence: true
end
