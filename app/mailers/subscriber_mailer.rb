class SubscriberMailer < ActionMailer::Base
  default from: "Art Overflow <info@artoverflow.com>"
  add_template_helper(SubscriberHelper)
  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(to: subscriber.email, subject: 'Добро пожаловать в Art Overflow!')
  end
end
