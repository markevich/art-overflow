module KnowsAboutUsers
  def current_user
    @current_user ||= create(:user)
  end

  def current_user= user
    @current_user = user
  end
  
  def another_user
    @another_user ||= create(:user, :another)
  end
end


module KnowsAboutAuthentication
  include Warden::Test::Helpers
  
  def i_am_logged_in
    login current_user
  end

  def login user
    login_as user, scope: :user
  end
end


World KnowsAboutUsers
World KnowsAboutAuthentication