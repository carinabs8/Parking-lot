class StatusControll < ActiveRecord::Base
  self.per_page = 5

  has_many    :vacancies
  belongs_to  :vacancy
  
  AVAILABLE   = "0"
  RESTRICTED  = "1"
  BUSY        = "2"
  
  scope :closed, where("time_end is NOT NULL")

  scope :by_input_hours, lambda{|time_begin, time_end|
    where(
      :timebegin => Time.new(time_begin.year, time_begin.month, time_begin.day, time_begin.hour) ..
                    Time.new(time_end.year, time_end.month, time_end.day, time_end.hour)
    )  
  }

  scope :by_daily, where(
      :timebegin =>  (Time.now.at_beginning_of_day) .. (Time.now)
      )
    
  scope :by_vacancies, lambda{|vacancies| where(:vacancy_id => vacancies)}
  
  def self.analytic_report(params={})
    closed.by_input_hours(params[:begin], params[:end]).by_vacancies(params[:vacancies])
  end

  def self.frequency_report(params={})
    closed.by_input_hours(params[:begin], params[:end]).by_vacancies(params[:vacancies]).select('vacancy_id, count(id) as total_vagas').group(:vacancy_id)
  end

  def self.idleness_report(params={})
    closed.by_input_hours(params[:begin], params[:end]).by_vacancies(params[:vacancies]).select('vacancy_id, count(id) as total_vagas').where(:current_status => AVAILABLE).group(:vacancy_id)
  end
end
