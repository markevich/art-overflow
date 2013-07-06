class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include PublicActivity::StoreController
  include Concerns::TheCommentsController::ViewToken

  add_flash_types :error, :success

  rescue_from CanCan::AccessDenied do |exception|
    render_404
  end

  before_filter :set_cookie_current_user

  if Rails.env.test?
    rescue_from Exception do |e|
      logger.error e
      logger.error e.backtrace.join "\n"
      raise e
    end
  end

  protected
  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found , layout: false
  end

  before_filter :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :nickname, :email, :password, :password_confirmation) }
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end
  helper_method :permitted_params

  private
  def set_cookie_current_user
    cookies[:current_user] = {id: current_user.id}.to_json if user_signed_in?
  end
end
