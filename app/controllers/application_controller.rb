class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery
  before_filter :fetch_categories



  def index

  end
  
  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found , layout: false
  end

  def check_user
    render_404 and return unless user_signed_in?
  end

  if Rails.env.test?
    rescue_from Exception do |e|
      logger.error e
      logger.error e.backtrace.join "\n"
      raise e
    end
  end

  private

  def fetch_categories
    @drawing_categories = DrawingCategory.scoped
  end
end
