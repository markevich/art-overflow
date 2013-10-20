class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  validates :first_name, :last_name, :nickname, :email, presence: true

  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  ROLES = %w[admin moderator]

  acts_as_follower
  acts_as_followable

  include PublicActivity::Model

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
end
