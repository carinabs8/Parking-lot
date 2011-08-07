class AddRoleToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |u|
      u.integer :role, :default => 1
    end
    User.update_all ["role = ?", 1]
  end

  def self.down
    remove_column :users, :role
  end
end
