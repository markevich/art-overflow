class Picture < ActiveRecord::Base
  include PublicActivity::Model
  include Commentable

  acts_as_taggable

  belongs_to :user, dependent: :destroy
  belongs_to :gallery, dependent: :destroy
  has_many :likes, as: :likeable

  validates :name, :path, :user_id, presence: true

  mount_uploader :path, PictureUploader
end
