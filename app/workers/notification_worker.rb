class NotificationWorker
  include Sidekiq::Worker

  sidekiq_options retry: false

  def perform(event_type, model_id)
    case event_type
    when "new_comment"
      NewCommentMailer.send_notification(model_id)
    when "new_follower"
      NewFollowerMailer.send_notification(model_id)
    end
  end
end
