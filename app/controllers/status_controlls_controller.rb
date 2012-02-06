class StatusControllsController < ApplicationController
  before_filter :require_user
  before_filter :get_report, :only => [:analytic, :make_pdf, :make_csv]
  before_filter :get_start_year, :get_end_year
  
  def analytic
  end
  
  def search 
    time_begin  = StatusControll.get_time_begin(params) 
    time_end    = StatusControll.get_time_end(params)
    
    maps        = params[:status_controll][:map].reject(&:blank?) 
    vacancies   = params[:status_controll][:vacancy].reject(&:blank?) rescue Vacancy.all.map(&:id)
    
    redirect_to  analytic_reports_path(:time_begin => time_begin, :time_end => time_end, :maps => maps, :vacancies => vacancies)
  end
  
  def vacancy
    maps = params[:vacancies].to_s
    @vacancies = Vacancy.by_map(maps.scan(/\w+/))
    render :layout => false
  end
  
  def make_pdf
    render :layout => false
  end
  
  def make_csv
    report = File.new("new.csv", "w")
    report.puts "Registro, Inicio, Fim, Vaga, Tempo Total"
    i = 1
    linha = ""
    @status_vacancies.each do |data|
      linha << "#{i},#{data.timebegin.strftime("%d/%m/%Y as %H:%M:%S")},#{data.time_end.strftime("%d/%m/%Y as %H:%M:%S")},#{data.vacancy.codigo}"
      
      report.puts linha
      i = i+1
    end
    report.close
    send_file "new.csv"
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
