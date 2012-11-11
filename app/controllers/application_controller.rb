class ApplicationController < ActionController::Base
  layout 'application'
  protect_from_forgery
  
  def index

  end
  
  if Rails.env.test?
    rescue_from Exception do |e|
      logger.error e
      logger.error e.backtrace.join "\n"
    end
  end
end
