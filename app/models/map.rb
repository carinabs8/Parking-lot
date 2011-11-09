class Map < ActiveRecord::Base
  has_many :vacancies, :dependent => :destroy
  validates_presence_of :photo_file_name
  validates_presence_of :codigo
  validates_uniqueness_of :codigo
  
  has_attached_file :photo, :styles => { :small => "900x560" }
  cattr_reader :per_page
	@@per_page = 10
  
  def vacancy_changed?(vacancies_status)
    vacancies = self.vacancies.map{|vacancy| [vacancy.id, vacancy.status]}
    vacancies_status.sort! != vacancies.sort!
  end
  
  class << self
    def combo
      Map.order("codigo").collect {|c| [c.codigo]}
    end
  end
end
