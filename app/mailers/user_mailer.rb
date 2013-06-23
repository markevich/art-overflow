class UserMailer < ActionMailer::Base
  default from: "info@artoverflow.com"
  def welcome_email
    mail(to: 'onemur@gmail.com', subject: 'Hi!')
  end
end
