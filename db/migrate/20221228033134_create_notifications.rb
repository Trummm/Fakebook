class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notified_by_id
      t.integer :notificationable_id
      t.string :notificationable_type
      t.string :notice_type
      t.boolean :read, default: false
      t.boolean :checked, default: false
      t.timestamps
    end
  end
end
