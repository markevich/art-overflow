class Picture < ActiveRecord::Base
  include PublicActivity::Model
  include Commentable
  include Likeable

  acts_as_taggable

  belongs_to :user
  belongs_to :gallery

  validates :name, :path, :user, presence: true

  mount_uploader :path, PictureUploader

  scope :latest, -> { order(:created_at).limit(15).reverse_order }

  delegate :name, to: :user, prefix: true
end
