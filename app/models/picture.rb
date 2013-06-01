class Picture < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  validates :name, :path, :user_id, presence: true
  belongs_to :user

  acts_as_voteable

  mount_uploader :path, PictureUploader
end
