class CreateVagaStatus < ActiveRecord::Migration
  def self.up
    create_table :vaga_status do |t|
      t.integer :vaga_id
      t.integer :status_controll_id
      t.string  :status
    end
  end

  def self.down
    drop_table :vaga_status
  end
end
