class Picture < ActiveRecord::Base
  include PublicActivity::Model
  include Commentable

  acts_as_taggable

  belongs_to :user
  belongs_to :gallery

  validates :name, :path, :user_id, presence: true

  mount_uploader :path, PictureUploader
end
