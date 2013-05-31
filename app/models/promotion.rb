class Promotion < ActiveRecord::Base
  validate :email, presence: true, uniquiness: true
end
