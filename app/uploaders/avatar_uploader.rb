class AvatarUploader < CarrierWave::Uploader::Base
  CROP_AREA_WIDTH = 800.freeze
  CROP_AREA_HEIGHT = 600.freeze
  THUMB_WIDTH = 200.freeze
  THUMB_HEIGHT = 200.freeze
  THUMB_ASPECT_RATIO = (THUMB_WIDTH.to_f / THUMB_HEIGHT).freeze
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer
  include Uploaders::Mixin::Base

  storage :file
  def store_dir
    "uploads/avatars/#{model.id}"
  end

  process :crop => [CROP_AREA_WIDTH, CROP_AREA_HEIGHT]
  process :optimize
  process :resize_to_fill => [THUMB_WIDTH, THUMB_HEIGHT]

  def filename
    "avatar.#{model.path.file.extension}" if original_filename.present?
  end

  def default_url
    ActionController::Base.helpers.asset_path("fallback/default_avatar.png")
  end
end
