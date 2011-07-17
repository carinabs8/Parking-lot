class CreateVagas < ActiveRecord::Migration
  def self.up
    create_table :vagas do |t|
      t.string  :codigo
      t.boolean :status
      t.boolean :especial
      t.integer :map_id
      t.string  :eixo_x
      t.string  :eixo_y
      t.timestamps
    end
  end

  def self.down
    drop_table :vagas
  end
end
