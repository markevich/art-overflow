class UsersController < ApplicationController
  layout 'user'
  def drawings
    @user = User.find params[:id]
    @drawings = @user.drawings
    render layout: 'application'
  end

  def show
    @user = User.find(params[:id])
  end
end