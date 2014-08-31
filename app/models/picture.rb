class Picture < ActiveRecord::Base
  include Trackable
  include Commentable
  extend Enumerize

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  acts_as_taggable_on :tags
  mount_uploader :path, PictureUploader

  enumerize :graphics_type, in: ['2d', '3d'], default: '2d'

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :album, counter_cache: true, touch: true
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :emotions, dependent: :destroy
  has_and_belongs_to_many :categories

  validates :name, :path, :user, :graphics_type, presence: true
  validates :name, length: { minimum: 1, maximum: 250 }

  delegate :name, to: :user, prefix: true
  delegate :name, to: :album, prefix: true
  delegate :avatar, to: :user, prefix: true

  alias_method :activity_owner, :user

  auto_html_for :description do
    html_escape
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end

  def recipient
    nil
  end
end
