class NewCommentMailer < ActionMailer::Base
  default from: "notifications@artoverflow.com"

  def send_notification(comment_id)
    @comment = Comment.find(comment_id)
    user = @comment.recipient
    email_with_name = "#{user.name} <#{user.email}>"
    mail(to: email_with_name, subject: "Пользователь #{@comment.user.name} оставил комментарий к вашей работе!").deliver
  end
end
