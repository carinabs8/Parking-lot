class RemoveStatusToVaga < ActiveRecord::Migration
  def self.up
    add_column :vagas, :cod_arduino, :string
  end

  def self.down
  end
end
