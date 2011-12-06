require 'open-uri'
class StatusControllsController < ApplicationController
  before_filter :require_user
  before_filter :get_report, :only => [:show, :make_pdf]
  
  def show
  end
  
  def search
    time_begin = "#{params[:status_controll]["time_begin(1i)"]}-#{params[:status_controll]["time_begin(2i)"]}-#{params[:status_controll]["time_begin(3i)"]}"
    redirect_to report_path(time_begin)
  end
  
  def make_pdf
    render :layout => false
  end
  
  private
    def get_report
      begin
        @time_begin = params[:id].to_datetime
      rescue
        @time_begin = Time.now
      end
      @status_vacancies = StatusControll.closed.by_time_begin(@time_begin)
    end
end
