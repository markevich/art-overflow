class UsersController < ApplicationController
  layout 'user'
  def drawings
    @user = User.find params[:id]
    @drawings = @user.drawings
    render layout: 'application'
  end
end