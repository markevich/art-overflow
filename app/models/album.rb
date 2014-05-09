class Album < ActiveRecord::Base
  belongs_to :user
  has_many :pictures, dependent: :restrict_with_exception

  validates :name, :user, presence: true
  validates :name, length: { minimum: 1, maximum: 250 }

  delegate :name, to: :user, prefix: true
  delegate :count, to: :pictures, prefix: true

  def to_header_path
    "#{to_partial_path}_header"
  end
end
