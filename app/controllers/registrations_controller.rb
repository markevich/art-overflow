class RegistrationsController < Devise::RegistrationsController
  def create
    super
  end

  protected
  def after_inactive_sign_up_path_for(resource)
    pictures_path
  end

end
