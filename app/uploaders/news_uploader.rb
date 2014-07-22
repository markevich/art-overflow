class NewsUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer
  include Uploaders::Mixin::Base

  storage :file
  def store_dir
    "uploads/#{model.user_id}/news"
  end

  process :crop
  process :resize_to_fill => [600, 400]
  process :interlace

  def crop
    resize_to_limit(600, 400)
    manipulate! do |img|
      img.crop("600x400+0+0")
      img
    end
  end

  def filename
    "#{model.id}.#{model.picture.file.extension}" if original_filename.present?
  end
end
