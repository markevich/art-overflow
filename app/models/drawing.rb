class Drawing < ActiveRecord::Base
  attr_protected :path, :user_id
  belongs_to :user
  mount_uploader :path, DrawingUploader
end
