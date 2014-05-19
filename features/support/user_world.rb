module UserWorld
  include Warden::Test::Helpers
  def current_user
    @current_user
  end

  def create_many_users(count)
    @users = create_list(:user, count)
  end

  def create_user
    expect(@current_user).to be_nil
    create(:user, email: user_email, password: user_password, password_confirmation: user_password)
  end

  def another_user
    @another_user
  end

  def create_another_user
    expect(@another_user).to be_nil
    @another_user = create(:user)
  end

  def login user
    login_as user, scope: :user
  end

  def user_logged_in
    @current_user = create_user
    login current_user
  end

  def check_unregistered_user
    expect(current_user).to be_nil
  end

  def visit_registration_page
    visit new_user_registration_path
  end

  def visit_authentication_page
    visit new_user_session_path
  end

  def fill_registration_form
    fill_in('user_name', with: 'Bruce Wayne')
    fill_in('user_email', with: user_email)
    fill_in('user_password', with: user_password)
    choose(:user_sex_male)
  end

  def fill_authorization_form
    fill_in('user_email', with: user_email)
    fill_in('user_password', with: user_password)
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

  def profile_followers_counter_value
    find('.profil-data').find('.user-counters').find('.followers').find('.count').text.to_i
  end
end

World(UserWorld)
