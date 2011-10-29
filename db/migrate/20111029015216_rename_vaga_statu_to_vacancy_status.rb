class RenameVagaStatuToVacancyStatus < ActiveRecord::Migration
  def self.up
    rename_table :vaga_status, :vacancy_statuses
  end

  def self.down
    rename_table  :vacancy_status, :vaga_statuses
  end
end
