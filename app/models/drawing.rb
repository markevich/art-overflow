class Drawing < ActiveRecord::Base
  mount_uploader :path, DrawingUploader
end
