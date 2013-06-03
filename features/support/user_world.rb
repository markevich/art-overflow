module UserWorld
  include Warden::Test::Helpers
  def current_user
    @current_user ||= create_user
  end

  def create_user
    expect(@current_user).to be_nil
    create(:user)
  end

  def another_user
    @another_user ||= create_another_user
  end

  def create_another_user
    expect(@another_user).to be_nil
    create(:user)
  end

  def user_logged_in
    login_as current_user, scope: :user
  end

  def check_unregistered_user
    expect(@current_user).to be_nil
  end
end

World(UserWorld)
