class Picture < ActiveRecord::Base
  include PublicActivity::Model

  acts_as_voteable
  acts_as_taggable

  belongs_to :user
  belongs_to :gallery
  has_many :comments, as: :commentable

  validates :name, :path, :user_id, presence: true

  mount_uploader :path, PictureUploader
end
