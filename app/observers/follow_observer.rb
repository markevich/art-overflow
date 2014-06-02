class FollowObserver < ActiveRecord::Observer
  def after_commit(follow)
    if follow.created_at == follow.updated_at
      if follow.recipient.notification_settings.subscribers
        NotificationWorker.perform_async(:new_follower, follow.id)
      end
    end
  end
end