class AddDefaultFalseToReadInNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column :notifications, :read, :boolean, default: false
  end
end
