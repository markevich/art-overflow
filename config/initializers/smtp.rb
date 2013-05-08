ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'artoverflow.com',
  :user_name            => 'mailer@nicedrawing.mygbiz.com',
  :password             => '1231231admin',
  :authentication       => 'plain',
  :enable_starttls_auto => true  }
