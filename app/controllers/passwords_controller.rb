class PasswordsController < Devise::PasswordsController
  protected
  def after_resetting_password_path_for(user)
    edit_user_path(user)
  end
end