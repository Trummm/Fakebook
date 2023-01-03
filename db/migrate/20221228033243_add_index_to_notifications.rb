class AddIndexToNotifications < ActiveRecord::Migration[6.1]
  def change
    add_index :notifications, :user_id
    add_index :notifications, :notified_by_id
    add_index :notifications, ["notificationable_id", "notificationable_type"], :name => "fk_notificationables"
    add_index :notifications, [:read, :checked]
  end
end
