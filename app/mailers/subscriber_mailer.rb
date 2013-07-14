class SubscriberMailer < ActionMailer::Base
  default from: "Art Overflow <info@artoverflow.com>"
  add_template_helper(SubscriberHelper)
  def welcome_email(subscriber)
    @subscriber = subscriber
    attachments.inline['mailer-bg.gif'] = File.read("#{Rails.root}/app/assets/images/mailer-bg.gif")
    attachments.inline['mailer-vkontakte.png'] = File.read("#{Rails.root}/app/assets/images/mailer-vkontakte.png")
    attachments.inline['mailer-twitter.png'] = File.read("#{Rails.root}/app/assets/images/mailer-twitter.png")
    attachments.inline['mailer-header-top.gif'] = File.read("#{Rails.root}/app/assets/images/mailer-header-top.gif")
    attachments.inline['mailer-header-bottom.gif'] = File.read("#{Rails.root}/app/assets/images/mailer-header-bottom.gif")
    mail(to: subscriber.email, subject: 'Добро пожаловать в Art Overflow!')
  end
end
