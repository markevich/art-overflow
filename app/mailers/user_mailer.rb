class UserMailer < ActionMailer::Base
  default from: "Art Overflow <info@artoverflow.com>"
  def welcome_email
    mail(to: ['slava.markevich@gmail.com', 'onemur@gmail.com'], subject: 'Hi!')
  end
end
