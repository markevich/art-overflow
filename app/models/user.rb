class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  validates :name, :email, :role, presence: true
  has_many :pictures
  
  has_and_belongs_to_many :followers,
    :class_name => "User",
    :association_foreign_key => "id",
    :join_table => "followers_users"

  ROLES = %w[admin moderator]

  acts_as_follower
  acts_as_followable
  acts_as_voter

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  def become_admin!
    update_attribute(:role, :admin)
  end

  def admin?
    role && role.to_sym == :admin
  end

end
