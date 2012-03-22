class Admin::StatusControllsController < ApplicationController
  before_filter :require_user
  before_filter :analytic_report, :only => [:analytic, :make_pdf, :make_csv]
  
  def index
  end
  
  def analytic
  end
  
  def daily
    vacancies = Vacancy.all.map(&:id)
    @status_vacancies = StatusControll.closed.by_daily.by_vacancies(vacancies).paginate(:page => params[:page])
  end
  
  def search
    time_begin  = params[:status_controll][:time_begin]
    time_end    = params[:status_controll][:time_end]
    
    
    unless(params[:status_controll][:vacancy].blank? || params[:status_controll][:map].blank?)
      maps        = params[:status_controll][:map] 
      vacancies   = params[:status_controll][:vacancy]
      redirect_to  analytic_reports_path(:time_begin => time_begin, :time_end => time_end, :maps => maps, :vacancies => vacancies)
    else
      analytic_report
      flash[:analytic_report] = 'Entre com pelo menos um mapa e uma vaga!'
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
    def analytic_report
      @time_begin = params[:time_begin].to_datetime rescue Time.now
      @time_end   = params[:time_end].to_datetime rescue Time.now   
      @maps       = Map.all
      @vacancies  = Vacancy.by_map(@maps)
      buscar = {:begin => @time_begin, :end => @time_end, :maps => params[:maps], :vacancies => params[:vacancies]}
      @status_vacancies = StatusControll.analytic_report(buscar).paginate(:page => params[:page])
      flash[:analytic_report_blank] = "Nenhum registro foi encontrado." if  @status_vacancies.blank?
    end
end
