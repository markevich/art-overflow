class UserPasswordsController < ApplicationController
  before_action :authenticate_user!

  def update
    if resource.update_with_password(permitted_params[:user])
      sign_in(resource, bypass: true)
      flash[:notice] = 'Пароль успешно изменен'
    end
    respond_with(resource, location: url_for([:edit, current_user]))
  end

  private

  helper_method :resource

  def resource
    current_user
  end

  def permitted_params
    params.permit(user: [:password, :password_confirmation, :current_password])
  end
end
