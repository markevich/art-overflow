module Trackable
  extend ActiveSupport::Concern

  included do
    include PublicActivity::Model

    tracked owner: Proc.new{ |controller, model| model.activity_owner },
      recipient:  Proc.new{ |controller, model| model.recipient },
      only: [:create]

    after_destroy do
      activity = PublicActivity::Activity.find_by(trackable: self)
      activity.destroy if activity
    end
  end
end