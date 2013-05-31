class PromotionsController < ApplicationController
  layout false
  def index
    @promotion = Promotion.new
  end
  def create
    Promotion.create(permitted_params.invite)
    redirect_to action: :index
  end
end
