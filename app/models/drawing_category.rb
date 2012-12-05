class DrawingCategory < ActiveRecord::Base
  attr_accessible :name

  has_many :drawings
end
