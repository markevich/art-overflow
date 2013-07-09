module UserWorld
  include Warden::Test::Helpers
  def current_user
    @current_user
  end

  def create_user
    expect(@current_user).to be_nil
    create(:user)
  end

  def another_user
    @another_user
  end

  def create_another_user
    expect(@another_user).to be_nil
    @another_user = create(:user)
  end

  def user_logged_in
    @current_user = create_user
    login_as current_user, scope: :user
  end

  def check_unregistered_user
    expect(current_user).to be_nil
  end

  def visit_registration_page
    visit new_user_registration_path
  end

  def fill_registration_form
    fill_in('user_first_name', with: 'Bruce')
    fill_in('user_last_name', with: 'Wayne')
    fill_in('user_nickname', with: 'Batman')
    fill_in('user_email', with: user_email)
    fill_in('user_password', with: user_password)
    fill_in('user_password_confirmation', with: user_password)
  end

  def user_email
    @user_email ||= 'example@example123123.com'
  end

  def user_password
    @user_password ||= 'user_password'
  end

  def confirmation_mail
    ActionMailer::Base.deliveries.last
  end

  def confirmation_mail_link
    link = confirmation_mail.body.encoded.match(/http.+confirmation\?(\w+=\w+&?)*/)[0]
    expect(link.scan('confirmation_token')).to_not be_nil
    link
  end
end

World(UserWorld)