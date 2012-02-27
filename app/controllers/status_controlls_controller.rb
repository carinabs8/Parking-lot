class StatusControllsController < ApplicationController
  before_filter :require_user
  before_filter :get_report, :only => [:analytic, :make_pdf, :make_csv]
  
  def analytic
  end
  
  def search
    time_begin  = params[:status_controll][:time_begin].to_datetime
    time_end    = params[:status_controll][:time_end].to_datetime
    
    unless (params[:status_controll][:map].blank? || params[:status_controll][:vacancy].blank?)
      maps        = params[:status_controll][:map].reject(&:blank?) 
      vacancies   = params[:status_controll][:vacancy].reject(&:blank?)
      redirect_to  analytic_reports_path(:time_begin => time_begin, :time_end => time_end, :maps => maps, :vacancies => vacancies)
    else
      get_report
      flash[:search_error] = 'Entre com pelo menos um mapa e uma vaga!'
      render :analytic
    end
  end
  
  def vacancy
    maps = params[:maps].to_s
    @vacancies = Vacancy.by_map(maps.scan(/\w+/))
    render :layout =>false
  end
  
  def make_pdf
    render :layout => false
  end
  
  def make_csv
    report = File.new("new.csv", "w")
    report.puts "Registro, Inicio, Fim, Vaga, Tempo Total"
    i = 1
    
    @status_vacancies.each do |data|
      time_begin = data.timebegin.strftime(t("date.formats.reports"))
      time_end = data.time_end.strftime(t("date.formats.reports"))
      codigo = data.vacancy.codigo
      
      min = (data.time_end.min - data.timebegin.min)
      hora = (data.time_end.hour - data.timebegin.hour)
      report.puts "#{i},#{time_begin},#{time_end},#{codigo}, #{hora}:#{min}"
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
      @vacancies  = Vacancy.by_map(@maps)
      
      if params[:vacancies]
        @params_vacancies = params[:vacancies] 
      else
        @params_vacancies = Vacancy.all.map(&:id)
      end
      
      @status_vacancies = StatusControll.closed.by_time_begin(@time_begin).by_time_end(@time_end).by_vacancies(@params_vacancies).paginate(:page => params[:page])
    end
end
