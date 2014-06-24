class NotificationSettingsController < InheritedResources::Base
  before_action :authenticate_user!
  defaults :singleton => true, instance_name: 'notification_settings'

  def permitted_params
    params.permit(notification_settings:
    [
      :news,
      :comments,
      :subscribers
    ]).tap do |whitelist|
      whitelist[:notification_settings] ||= {}
      whitelist[:notification_settings][:user_id] = current_user.id
    end.permit!
  end

  private

  def smart_collection_url
    notification_settings_path
  end

  def resource
    current_user.notification_settings
  end
end