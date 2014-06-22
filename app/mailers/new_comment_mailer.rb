class NewCommentMailer < ActionMailer::Base
  default from: "Art Overflow <info@artoverflow.com>"

  def send_notification(comment_id)
    @comment = Comment.find(comment_id)
    @recipient = @comment.recipient
    @user = @comment.user
    @picture = @comment.commentable
    email_with_name = "#{@recipient.name} <#{@recipient.email}>"

    return if @recipient.id == @user.id

    mail(to: email_with_name,
         bcc: ['slava.markevich@gmail.com', 'onemur@gmail.com'],
         subject: "Пользователь #{@user.name} оставил комментарий к вашей работе!").deliver
  end
end
