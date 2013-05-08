class Invite < ActiveRecord::Base
  validate :email, presence: true, uniquiness: true
end
