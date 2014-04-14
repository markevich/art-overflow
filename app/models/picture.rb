class Picture < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  include PublicActivity::Model
  include Commentable
  include Likeable

  acts_as_taggable

  belongs_to :user
  belongs_to :gallery

  validates :name, :path, :user, presence: true

  mount_uploader :path, PictureUploader

  scope :latest, -> { order(:created_at).reverse_order.limit(15) }
  scope :popular, -> { order(likes_count: :desc).limit(15) }

  delegate :name, to: :user, prefix: true
end
