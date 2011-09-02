class AddVagaStatusToReport < ActiveRecord::Migration
  def self.up
    change_table :reports do |u|
      u.boolean :vaga_status, :default => true
    end
  end

  def self.down
    remove_column :reports, :vaga_status
  end
end
