class ConfirmationsController < Devise::ConfirmationsController

  protected
  def after_confirmation_path_for(resource_name, resource)
    pictures_path
  end

end
