class NewFollowerMailer < ActionMailer::Base
  default from: "Art Overflow <info@artoverflow.com>"

  def send_notification(follow_id)
    @follow = Follow.find(follow_id)
    @follower = @follow.follower
    @recipient = @follow.recipient

    email_with_name = "#{@recipient.name} <#{@recipient.email}>"
    mail(to: email_with_name,
         bcc: ['slava.markevich@gmail.com', 'onemur@gmail.com'],
         subject: "Пользователь #{@follower.name} подписался на ваши обновления.").deliver
  end
end
