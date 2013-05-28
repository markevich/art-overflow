class Picture < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  mount_uploader :path, PictureUploader
end
