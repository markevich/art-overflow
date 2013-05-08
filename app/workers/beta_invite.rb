class BetaInvite
  include Sidekiq::Worker

  def perform(lucky_user_id, executor_id)
    executor = User.find(executor_id)
    user = User.find(lucky_user_id)
    return unless User.where(email: user.email).empty?
    user.invite!({email: user.email}, executor)
  end
end
