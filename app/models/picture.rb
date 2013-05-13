class Picture < ActiveRecord::Base
  mount_uploader :path, PictureUploader
end
