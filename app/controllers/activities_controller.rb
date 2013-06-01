class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity
      .includes([:owner, :trackable])
      .where(owner_id: current_user.all_following, owner_type: "User")
      .order("created_at desc")
  end
end
