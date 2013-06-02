class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include PublicActivity::StoreController
  include TheCommentsController::ViewToken

  rescue_from CanCan::AccessDenied do |exception|
    render_404
  end

  protected
  def check_user
    render_404 and return unless user_signed_in?
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found , layout: false
  end

  def permitted_params
    @permitted_params ||= PermittedParams.new(params, current_user)
  end
  helper_method :permitted_params
end
