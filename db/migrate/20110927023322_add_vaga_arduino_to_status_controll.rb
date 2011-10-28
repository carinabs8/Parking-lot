class AddVagaArduinoToStatusControll < ActiveRecord::Migration
  def self.up
    add_column :status_controlls, :cod_arduino, :string
  end

  def self.down
    remove_column :status_controlls, :cod_arduino
  end
end
