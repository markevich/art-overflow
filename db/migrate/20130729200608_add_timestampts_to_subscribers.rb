class AddTimestamptsToSubscribers < ActiveRecord::Migration
  def change
    add_column(:subscribers, :created_at, :datetime)
    add_column(:subscribers, :updated_at, :datetime)
    Subscriber.all.each { |s| s.touch }
  end
end
