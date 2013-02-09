class DrawingCategory < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :drawings
  has_ancestry
  
  validates_uniqueness_of :name
end
