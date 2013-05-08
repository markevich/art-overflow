class InvitesController < ApplicationController
  layout false
  def index
    @invite = Invite.new
  end
  def create
    Invite.create(permitted_params.invite)
    redirect_to action: :index
  end
end
