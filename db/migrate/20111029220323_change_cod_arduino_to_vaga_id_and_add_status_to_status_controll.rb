class ChangeCodArduinoToVagaIdAndAddStatusToStatusControll < ActiveRecord::Migration
  def self.up
    remove_column :status_controlls, :cod_arduino
    add_column :status_controlls, :vacancy_id, :integer
    add_column :status_controlls, :current_status, :integer
    add_column :status_controlls, :old_status, :integer
  end

  def self.down
    add_column :status_controlls, :cod_arduino, :integer
    remove_column :status_controlls, :vacancy_id
    remove_column :status_controlls, :current_status
    remove_column :status_controlls, :old_status
  end
end
