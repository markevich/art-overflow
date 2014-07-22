class News < ActiveRecord::Base
  scope :published, -> { where(published: true) }

  validates :title, :body, :picture, :short_body, presence: true

  mount_uploader :picture, NewsUploader
end
