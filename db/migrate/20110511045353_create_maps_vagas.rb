class MapsVagas < ActiveRecord::Migration
  def self.up
    create_table :maps_vagas, :id => false do |t|
      t.integer :vaga_id
      t.integer :map_id
      t.string  :eixo_x
      t.string  :eixo_y
    end
  end

  def self.down
    drop_table :maps_vagas
  end
end
