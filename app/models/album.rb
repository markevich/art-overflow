class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures

  validates :name, :user, presence: true

  def to_header_path
    "#{to_partial_path}_header"
  end
end
