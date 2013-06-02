class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include PublicActivity::StoreController

  rescue_from CanCan::AccessDenied do |exception|
    render_404
  end

  before_filter :set_cookie_current_user

  protected
  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found , layout: false
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
