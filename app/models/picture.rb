class Picture < ActiveRecord::Base
  include Trackable

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  include Commentable

  CATEGORIES = [
    "Анимация",
    "Архитектура",
    "Персонажи",
    "Комиксы",
    "Концепт-арт",
    "Ландшафт",
    "Фентези",
    "Игры",
    "Фантастика",
    "Натюрморт",
    "Рассказ",
    "Сюрреализм",
    "Транспорт",
    "Мэт-пэйнтинг"
  ].freeze

  acts_as_taggable_on :tags
  acts_as_taggable_on :categories

  belongs_to :user, counter_cache: true, touch: true
  belongs_to :album, counter_cache: true, touch: true
  has_many :likes, as: :likeable, dependent: :destroy

  validates :name, :path, :user, presence: true
  validates :name, length: { minimum: 1, maximum: 250 }

  mount_uploader :path, PictureUploader

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
