class NewFollowerMailer < ActionMailer::Base
  default from: "notifications@artoverflow.com"

  def send_notification(follow_id)
    @follow = Follow.find(follow_id)
    user = @follow.recipient
    email_with_name = "#{user.name} <#{user.email}>"
    mail(to: email_with_name, subject: "Пользователь #{@follow.follower.name} теперь следит за вами в Art Overflow!").deliver
  end
end
