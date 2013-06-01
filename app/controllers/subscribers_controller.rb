class SubscribersController < ApplicationController
  layout false
  def index
    @subscriber = Subscriber.new
  end
  def create
    Subscriber.create(permitted_params.subscriber)
    redirect_to action: :index
  end
end
