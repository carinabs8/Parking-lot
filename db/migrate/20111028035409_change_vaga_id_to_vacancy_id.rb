class ChangeVagaIdToVacancyId < ActiveRecord::Migration
  def self.up
    rename_column :vaga_status, :vaga_id, :vacancy_id
  end

  def self.down
    rename_column :vaga_status, :vacancy_id, :vaga_id
  end
end
