require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_filter :set_cookie_current_user
  before_filter :configure_permitted_parameters, if: :devise_controller?
  after_filter :store_location

  if Rails.env.test?
    rescue_from Exception do |e|
      logger.error e
      logger.error e.backtrace.join "\n"
      raise e
    end
  end

  def store_location
    if request.fullpath != "/users/sign_in" && \
        request.fullpath != "/users/sign_up" && \
        !request.xhr?
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || pictures_path
  end

  def after_confirmation_path_for(resource_name, resource)
    new_user_session_path
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |e|
    redirect_to(smart_resource_url, :alert => e.message)
  end

  protected
  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found , layout: false
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:password, :password_confirmation) }
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end

  private
  def set_cookie_current_user
    if user_signed_in?
      cookies[:current_user] = {id: current_user.id}.to_json
    else
      cookies[:current_user] = nil
    end
  end
end
