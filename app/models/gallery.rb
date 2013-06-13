class Gallery < ActiveRecord::Base
  belongs_to :user
  has_many :pictures
  validates :user_id, :name, presence: true
end
