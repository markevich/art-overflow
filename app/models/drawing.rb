class Drawing < ActiveRecord::Base
  attr_protected :path, :user_id
  
  belongs_to :user
  belongs_to :drawing_category

  mount_uploader :path, DrawingUploader
end
