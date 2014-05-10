module Trackable
  extend ActiveSupport::Concern

  included do
    include PublicActivity::Model

    tracked owner: Proc.new{ |controller, model| controller.current_user },
      recipient:  Proc.new{ |controller, model| model.respond_to?(:user) ? model.user : nil },
      only: [:create]

    after_destroy do
      activity = PublicActivity::Activity.find_by(trackable: self)
      activity.destroy if activity
    end
  end
end