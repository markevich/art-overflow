module KnowsAboutUsers
  include Warden::Test::Helpers

  def current_user
    @current_user ||= create(:user)
  end

  def another_user
    @another_user ||= create(:user, :another)
  end
  def i_am_logged_in
    login current_user
  end

  def login user
    login_as user, scope: :user
  end
end

module KnowsAboutDrawings
  def drawing
    @drawing ||= create(:drawing)
  end
end

World KnowsAboutUsers
World KnowsAboutDrawings
