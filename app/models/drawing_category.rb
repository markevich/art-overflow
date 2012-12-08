class DrawingCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name
  attr_accessible :name
  has_many :drawings

  validates_uniqueness_of :name
end
