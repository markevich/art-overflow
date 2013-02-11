class UsersController < ApplicationController
  layout 'user'
  before_filter :set_model
  def drawings
    @drawings = @user.drawings
    render layout: 'application'
  end

  def show

  end

  def follow
  end
end

  private
  def set_model
    @user = User.find(params[:id])
  end