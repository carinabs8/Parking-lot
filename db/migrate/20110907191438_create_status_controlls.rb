class CreateStatusControlls < ActiveRecord::Migration
  def self.up
    create_table :status_controlls do |t|
      t.string  :status
      t.datetime :timebegin
      t.datetime :time_end
      t.integer  :vaga_id
      t.timestamps
    end
  end

  def self.down
    drop_table :status_controlls
  end
end
