class Picture < ActiveRecord::Base
  include Trackable

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  include Commentable

  acts_as_taggable_on :tags

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :album, counter_cache: true, touch: true
  has_many :likes, as: :likeable, dependent: :destroy

  validates :name, :path, :user, presence: true
  validates :name, length: { minimum: 1, maximum: 250 }

  mount_uploader :path, PictureUploader

  delegate :name, to: :user, prefix: true
  delegate :name, to: :album, prefix: true
  delegate :avatar, to: :user, prefix: true
end
