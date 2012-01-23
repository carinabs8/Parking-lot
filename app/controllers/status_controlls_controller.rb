require 'open-uri'
class StatusControllsController < ApplicationController
  before_filter :require_user
  before_filter :get_report, :only => [:analytic, :make_pdf]
  before_filter :get_start_year, :get_end_year
  
  def analytic
  end
  
  def search
    param       = params[:status_controll]   
    time_begin  = param["time_begin(1i)"] + "-" + param['time_begin(2i)'] + "-" + param['time_begin(3i)'] + " " + param['time_begin(4i)'] + ":" + param['time_begin(5i)'] 
    time_end    = param["time_end(1i)"] + "-" + param['time_end(2i)'] + "-" + param['time_end(3i)'] + " " + param['time_end(4i)'] + ":" + param['time_end(5i)'] 
    maps        = param[:map].reject(&:blank?) 
    vacancies   = param[:vacancy].reject(&:blank?) rescue Vacancy.all.map(&:id)
    
    redirect_to  analytic_reports_path(:time_begin => time_begin, :time_end => time_end, :maps => maps, :vacancies => vacancies)
  end
  
  def make_pdf
    render :layout => false
  end
  
  def vacancy
    maps = params[:vacancies].to_s
    @vacancies = Vacancy.by_map(maps.scan(/\w+/))
    render :layout => false
  end
  
  private
    def get_report
      @time_begin = params[:time_begin].to_datetime rescue Time.now
      @time_end   = params[:time_end].to_datetime rescue Time.now   
      @maps       = Map.all
      @vacancies  = Vacancy.by_map(params[:maps])
  
      if params[:vacancies]
        @params_vacancies = params[:vacancies] 
      else
        @params_vacancies = Vacancy.all.map(&:id)
      end
      
      @status_vacancies = StatusControll.closed.by_time_begin(@time_begin).by_time_end(@time_end).by_vacancies(@params_vacancies).paginate(:page => params[:page])
    end
    
    def get_start_year 
      @start_year = StatusControll.getStartYear
    end
    
    def get_end_year
      @end_year = StatusControll.getEndYear
    end
end
