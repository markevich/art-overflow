class Album < ActiveRecord::Base
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :avatar, AlbumUploader

  belongs_to :user, counter_cache: true, touch: true
  has_many :pictures, dependent: :destroy

  validates :name, :user, presence: true
  validates :name, length: { minimum: 1, maximum: 250 }

  delegate :name, to: :user, prefix: true
  delegate :count, to: :pictures, prefix: true

  def to_header_path
    "#{to_partial_path}_header"
  end
end
