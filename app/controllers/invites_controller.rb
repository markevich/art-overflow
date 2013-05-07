class InvitesController < ApplicationController
  layout false
  def index
    @invite = Invite.new
  end
  def create
    Invite.create(invite_params)
    redirect_to action: :index
  end
  
  private
  def invite_params
    params.require(:invite).permit(:email)
  end
end
