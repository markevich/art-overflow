class Picture < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  include Commentable
  include Likeable

  acts_as_taggable

  belongs_to :user, counter_cache: true
  belongs_to :album, counter_cache: true

  validates :name, :path, :user, presence: true

  mount_uploader :path, PictureUploader

  delegate :name, to: :user, prefix: true
  delegate :avatar, to: :user, prefix: true
end
