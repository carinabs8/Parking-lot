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
      if !self.minimum(:timebegin).nil?
        minimum(:timebegin).year 
      else
        Time.now.year
      end
    end
    
    def getEndYear
      if !self.maximum(:time_end).nil?
        maximum(:time_end).year
      else
        Time.now.year
      end
    end
    
    def get_time_begin(params={})
      param = params[:status_controll]  
      param["time_begin(1i)"] + "-" + param['time_begin(2i)'] + "-" + param['time_begin(3i)'] + " " + param['time_begin(4i)'] + ":" + param['time_begin(5i)']
    end
    
    def get_time_end(params={})
      param = params[:status_controll]  
      param["time_end(1i)"] + "-" + param['time_end(2i)'] + "-" + param['time_end(3i)'] + " " + param['time_end(4i)'] + ":" + param['time_end(5i)'] 
    end
  end
end
