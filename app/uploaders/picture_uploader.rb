# encoding: utf-8

class PictureUploader < CarrierWave::Uploader::Base
  CROP_AREA_WIDTH = 800.freeze
  CROP_AREA_HEIGHT = 600.freeze
  THUMB_WIDTH = 315.freeze
  THUMB_HEIGHT = 210.freeze
  THUMB_ASPECT_RATIO = (THUMB_WIDTH.to_f / THUMB_HEIGHT).freeze
  include CarrierWave::MiniMagick
  include CarrierWave::ImageOptimizer
  include Uploaders::Mixin::Base

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end


  # Create different versions of your uploaded files:
  version :thumb do
    process :crop => [CROP_AREA_WIDTH, CROP_AREA_HEIGHT]
    process :optimize
    process :resize_to_fill => [THUMB_WIDTH, THUMB_HEIGHT]
  end

  process :optimize

  # def filename
  #   "#{secure_token}.jpg" if original_filename.present?
  # end

  # protected
  # def secure_token
  #   var = :"@#{mounted_as}_secure_token"
  #   model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  # end
end
