class StatusControll < ActiveRecord::Base
  self.per_page = 5

  has_many    :vacancies
  belongs_to  :vacancy
  AVAILABLE   = "0"
  RESTRICTED  = "1"
  BUSY        = "2"
  
  scope :closed, lambda{ where("time_end is NOT NULL") }
  scope :by_time_begin, lambda{ |time_begin|
    where(
    :timebegin => Time.new(time_begin.year, time_begin.month, 1, 0, 0)..Time.new(time_begin.year, time_begin.month, time_begin.day, time_begin.hour, time_begin.min)
    )
  }
  
  scope :by_time_end, lambda{ |time_end|
    where(
    :time_end => Time.new(time_end.year, time_end.month, 1, 0, 0)..Time.new(time_end.year, time_end.month, time_end.day, time_end.hour, time_end.min)
    )
  }
  
  scope :by_vacancies, lambda{|vacancies| where(:vacancy_id => vacancies)}
  
  class << self
    def getStartYear
      minimum(:timebegin).year
    end
    
    def getEndYear
      maximum(:time_end).year
    end
  end
end
