class Picture < ActiveRecord::Base
  include PublicActivity::Model

  validates :name, :path, :user_id, presence: true
  belongs_to :user
  belongs_to :gallery

  acts_as_voteable
  acts_as_taggable

  mount_uploader :path, PictureUploader
end
