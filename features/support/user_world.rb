module UserWorld
  def current_user
    @current_user ||= create(:user)
  end

  def check_unregistered_user
    expect(@current_user).to be_nil
  end
end

World(UserWorld)
