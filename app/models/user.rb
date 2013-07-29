class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  validates :first_name, :last_name, :nickname, :email, presence: true

  has_many :pictures

  ROLES = %w[admin moderator]

  acts_as_follower
  acts_as_followable
  acts_as_voter

  include TheCommentsUser
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  def become_admin!
    update_attribute(:role, :admin)
  end

  def admin?
    role && role.to_sym == :admin
  end

  def comment_moderator? comment
    admin? || id == comment.holder_id || id == comment.user_id
  end

end
