class CommentObserver < ActiveRecord::Observer
  def after_commit(comment)
    if comment.created_at == comment.updated_at
      NotificationWorker.perform_async(:new_comment, comment.id)
    end
  end
end