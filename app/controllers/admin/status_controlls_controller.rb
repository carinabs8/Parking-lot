class Admin::StatusControllsController < ApplicationController
  before_filter :require_user
  before_filter :make_report, :only => [:analytic, :frequency, :idleness]
  
  def index
  end
  
  def analytic
    @status_vacancies = StatusControll.analytic_report(@buscar).paginate(:page => params[:page])

    if params[:time_begin] && (params[:vacancy].blank? || params[:map].blank?)
      flash[:analytic_report] = t(:require_vacancy_map)
    elsif @status_vacancies.blank?
      flash[:analytic_report_blank] = t(:entry_blank)        
    end
  end
  
  def frequency
    @status_vacancies = StatusControll.frequency_report(@buscar)
    if params[:time_begin] && (params[:vacancy].blank? || params[:map].blank?)
      flash[:analytic_report] = t(:require_vacancy_map)
    elsif @status_vacancies.blank?
      flash[:analytic_report_blank] = t(:entry_blank)      
    end
  end
  
  def idleness
    @status_vacancies = StatusControll.idleness_report(@buscar)
    if params[:time_begin] && (params[:vacancy].blank? || params[:map].blank?)
      flash[:analytic_report] = t(:require_vacancy_map)
    elsif @status_vacancies.blank?
      flash[:analytic_report_blank] = t(:entry_blank)      
    end
  end

  def vacancy
    maps = params[:map].to_s
    @vacancies = Vacancy.by_map(maps.scan(/\w+/))
    render :layout =>false
  end

  def analytic_pdf
    make_report
    @status_vacancies = StatusControll.analytic_report(@buscar)
    render :layout => false
  end
  
  def frequency_pdf
    make_report
    @status_vacancies = StatusControll.frequency_report(@buscar)
    render :layout => false
  end

  def idleness_pdf
    make_report
    @status_vacancies = StatusControll.idleness_report(@buscar)
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
    def make_report
      @time_begin = params[:time_begin].to_datetime rescue Time.now
      @time_end   = params[:time_end].to_datetime rescue Time.now
      @maps       = Map.all
      @vacancies  = Vacancy.by_map(@maps)
      @buscar = {:begin => @time_begin, :end => @time_end, :maps => params[:map], :vacancies => params[:vacancy]}
    end
end
