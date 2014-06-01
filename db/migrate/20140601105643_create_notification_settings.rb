class CreateNotificationSettings < ActiveRecord::Migration
  def change
    create_table :notification_settings do |t|
      t.references :user, index: true
      t.boolean :news, default: true
      t.boolean :comments, default: true
      t.boolean :subscribers, default: true

      t.timestamps
    end

    User.all.each do |user|
      user.create_notification_settings
    end
  end
end
