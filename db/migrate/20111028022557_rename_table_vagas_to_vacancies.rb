class RenameTableVagasToVacancies < ActiveRecord::Migration
  def self.up
    rename_table :vagas, :vacancies
  end

  def self.down
    rename_table :vacancies, :vagas
  end
end
