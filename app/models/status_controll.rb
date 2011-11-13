class StatusControll < ActiveRecord::Base
  cattr_reader :per_page
	@@per_page = 10
  
  has_many    :vacancies
  belongs_to  :vacancy
  AVAILABLE   = "0"
  RESTRICTED  = "1"
  BUSY        = "2"
  
  scope :closed, lambda{ where("time_end is NOT NULL") }
  scope :by_time_begin, lambda{ |time_begin|
    where(:timebegin => Time.new(time_begin.year, time_begin.month, 1)..time_begin)}

end
