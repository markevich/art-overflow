class News < ActiveRecord::Base
  validates :title, :body, :picture, :short_body, presence: true

  mount_uploader :picture, NewsUploader
end
