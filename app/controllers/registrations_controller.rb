class RegistrationsController < Devise::RegistrationsController
  layout "application", :only => [ :edit, :update ]

  def create
    super
  end

  protected

  def after_inactive_sign_up_path_for(resource)
    pictures_path
  end
end
