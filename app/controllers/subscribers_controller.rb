class SubscribersController < ApplicationController
  layout false
  def index
    @subscriber = Subscriber.new
  end
  def create
    @subscriber = Subscriber.new(permitted_params.subscriber)
    if @subscriber.save
      flash[:success] = 'Вы успешно подписаны на обновления.'
      redirect_to action: :index
    else
      flash[:alert] = @subscriber.errors.full_messages.to_sentence
      render action: :index
    end
  end
end
