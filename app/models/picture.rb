class Picture < ActiveRecord::Base
  # include PublicActivity::Model
  # tracked owner: Proc.new{ |controller, model| controller.current_user }
  validates :name, :path, :user_id, presence: true
  belongs_to :user

  mount_uploader :path, PictureUploader
end
