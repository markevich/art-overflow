class Category < ActiveRecord::Base
  KEYS = %i(animation architecture characters comics concept environment fantasy game creatures industrial matte transport)

  has_and_belongs_to_many :pictures

  validates :name, presence: true
end
