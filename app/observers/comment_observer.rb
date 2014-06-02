class CommentObserver < ActiveRecord::Observer
  def after_commit(comment)
    if comment.created_at == comment.updated_at
      if comment.recipient.notification_settings.comments
        NotificationWorker.perform_async(:new_comment, comment.id)
      end
    end
  end
end