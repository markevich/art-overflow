class Subscriber < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  before_create :generate_token

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Subscriber.where(token: random_token).exists?
    end
  end
end
