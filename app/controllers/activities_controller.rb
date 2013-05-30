class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity
      .includes(:owner)
      .includes(:trackable)
      .where(owner_id: current_user.id, owner_type: "User")
      .order("created_at desc")
  end
end
