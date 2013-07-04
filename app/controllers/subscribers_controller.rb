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

  def unsubscribe
    subscriber = Subscriber.find(params[:id])
    unless params[:token] && params[:token] == subscriber.token
      fail(ActiveRecord::RecordNotFound, I18n.t('errors.token_mismatch',
                                               expected: subscriber.token,
                                               got: params[:token] || 'nil'))
    end
    subscriber.destroy
    redirect_to subscribers_path, success: I18n.t('subscriber.unsubscribed')
  end
end
