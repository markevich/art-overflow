class SubscribersController < ApplicationController
  layout false
  def index
    @subscriber = Subscriber.new
  end
  def create
    @subscriber = Subscriber.new(permitted_params.subscriber)
    if @subscriber.save
      render json: { success: 'Вы успешно подписаны на обновления.' }
    else
      render json: { error: @subscriber.errors.full_messages.to_sentence }, status: 400
    end
  end
end
