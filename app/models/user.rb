class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable, :confirmable

  #validates :name, presence: true, uniqueness: true

  ROLES = %w[admin moderator]

  def admin?
    role == "admin"
  end
end
