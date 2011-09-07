class CreateTimeControlls < ActiveRecord::Migration
  def self.up
    create_table :time_controlls do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :time_controlls
  end
end
