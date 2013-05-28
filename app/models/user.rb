class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  #validates :name, presence: true, uniqueness: true
  has_many :pictures
  ROLES = %w[admin moderator]

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  def become_admin!
    update_attribute(:role, :admin)
  end

  def admin?
    role == :admin
  end
end
