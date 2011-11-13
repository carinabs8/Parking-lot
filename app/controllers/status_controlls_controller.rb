class StatusControllsController < ApplicationController
  before_filter :require_user
  def show
    time_begin = params[:time_begin].to_datetime
    @status_vagas = StatusControll.closed.by_time_begin(time_begin)
  end
  
  def create
    time_begin = "#{params[:status_controll]["time_begin(1i)"]}-#{params[:status_controll]["time_begin(2i)"]}-#{params[:status_controll]["time_begin(3i)"]}"
    redirect_to reports_path(time_begin)
  end
end
