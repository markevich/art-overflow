class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  mount_uploader :avatar, AvatarUploader

  before_create :set_password_confirmation
  after_create :create_notification_settings, unless: :skip_callbacks

  validates :name, :email, presence: true

  has_many :pictures, dependent: :destroy, inverse_of: :user do
    def popular_for_search
      order(likes_count: :desc).limit(3)
    end
  end

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :albums

  has_many :own_activities, class_name: PublicActivity::Activity, as: :owner
  has_many :received_activities, class_name: PublicActivity::Activity, as: :recipient

  has_many :follows, class_name: :follow, as: :follower
  has_one :notification_settings, dependent: :destroy

  def activities
    followable_ids = follows.pluck(:followable_id)
    if followable_ids.empty?
      PublicActivity::Activity.where("recipient_id = ?", id).group(:trackable_id, :id)
    else
      PublicActivity::Activity.where("(owner_id IN (?) AND recipient_id IS NULL) OR recipient_id = ?", followable_ids, id).group(:trackable_id, :id)
    end
  end

  acts_as_follower
  acts_as_followable

  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id, type: :integer, index: :not_analyzed
    indexes :name, type: :string, boost: 10
    indexes :likes_count, type: :integer
    indexes :followers_count, type: :integer
    indexes :city, type: :string
    indexes :avatar, as: 'avatar.to_s'
    indexes :popular_pictures, as: 'pictures.popular_for_search' do
      indexes :id, type: :integer, index: :no
      indexes :name, type: :string, index: :no
      indexes 'path.to_s', type: :string, index: :no
    end
  end

  def self.search(query_params)
    tire.search do
      query { string query_params } if query_params
      sort { by :likes_count }
    end
  end

  def likes_count
    pictures.sum(:likes_count)
  end

  def liked?(likeable)
    likes.exists?(likeable: likeable)
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

  def to_header_path
    "#{to_partial_path}_header"
  end

  protected
  def set_password_confirmation
    self.password_confirmation = self.password
  end
end
