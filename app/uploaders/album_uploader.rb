class AlbumUploader < CarrierWave::Uploader::Base
  CROP_AREA_WIDTH = 400.freeze
  CROP_AREA_HEIGHT = 300.freeze
  THUMB_WIDTH = 315.freeze
  THUMB_HEIGHT = 210.freeze
  THUMB_ASPECT_RATIO = (THUMB_WIDTH.to_f / THUMB_HEIGHT).freeze
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer
  include Uploaders::Mixin::Base

  storage :file
  def store_dir
    "uploads/#{model.user_id}/albums"
  end

  process :crop => [CROP_AREA_WIDTH, CROP_AREA_HEIGHT]
  process :optimize
  process :resize_to_fill => [THUMB_WIDTH, THUMB_HEIGHT]

  def filename
    "#{model.id}.#{model.avatar.file.extension}" if original_filename.present?
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/default_album.png")
  end
end
