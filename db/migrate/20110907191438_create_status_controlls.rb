class CreateStatusControlls < ActiveRecord::Migration
  def self.up
    create_table :status_controlls do |t|
      t.datetime  :timebegin
      t.datetime  :time_end
    end
  end

  def self.down
    drop_table :status_controlls
  end
end
