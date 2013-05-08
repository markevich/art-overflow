class BetaInvite
  include Sidekiq::Worker

  def perform(invite_id, executor_id)
    executor = User.find(executor_id)
    invite = Invite.find(invite_id)
    return unless User.where(email: invite.email).empty?
    User.invite!({email: invite.email}, executor)
  end
end
