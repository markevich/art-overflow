class Picture < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  include Commentable
  include Likeable

  acts_as_taggable

  belongs_to :user
  belongs_to :gallery

  validates :name, :path, :user, presence: true

  mount_uploader :path, PictureUploader

  delegate :name, to: :user, prefix: true
end
