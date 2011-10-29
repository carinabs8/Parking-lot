class AddStatusToVacancy < ActiveRecord::Migration
  def self.up
    add_column :vacancies, :status, :integer, :default => 0
    drop_table :vacancy_statuses
  end

  def self.down
    remove_column :vacancies, :status
    create_table :vacancy_statuses do |t|
      t.integer    :status
      t.string    :status_controll_id
      t.string    :vacancy_id
      t.timestamps
    end
  end
end
