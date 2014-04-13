class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :avatar, AvatarUploader

  before_create :set_password_confirmation

  validates :name, :email, presence: true

  has_many :pictures, dependent: :destroy, inverse_of: :user do
    def popular
      order(likes_count: :desc).limit(3)
    end
  end
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy, counter_cache: true
  delegate :latest, to: :pictures, prefix: true

  ROLES = %w[admin moderator]

  acts_as_follower
  acts_as_followable

  include PublicActivity::Model

  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id, type: :integer, index: :not_analyzed
    indexes :name, type: :string, boost: 10
    indexes :likes_count, type: :integer
    indexes :city, type: :string
    indexes :popular_pictures, as: 'pictures.popular' do
      indexes :id, type: :integer, index: :no
      indexes :name, type: :string, index: :no
      indexes :path, type: :string, index: :no
    end
  end

  def self.search(query_params)
    tire.search do
      query { string query_params } if query_params
      sort { by :likes_count }
    end
  end

  def liked?(likeable)
    likes.exists?(likeable: likeable)
  end

  def like(likeable)
    return false if liked?(likeable)

    likes.create(likeable: likeable)
  end

  def unlike(likeable)
    return false unless liked?(likeable)

    likes.find_by(likeable: likeable).destroy
  end

  def become_admin!
    update_attribute(:role, :admin)
  end

  def admin?
    role && role.to_sym == :admin
  end

  def premium?
    true
  end

  protected
  def set_password_confirmation
    self.password_confirmation = self.password
  end
end
