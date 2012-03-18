#encoding: UTF-8
class ViewMapsController < ApplicationController
  def index
    @search = Map.search(params[:search])
    @maps = @search.page(params[:page]).order("updated_at DESC")
    @map = Map.new
  end
  
  def show
    @map = Map.where(:codigo => params[:id]).first
  end
  
  def reload_map
    @map      = Map.where("id = ?", params[:map_id]).first
    vacancys_status = []
    vacancies = params[:vacancies].split(',')
    statuses = params[:statuses].split(',')

    (0...vacancies.length).each do |i|
      vacancys_status << [vacancies[i].to_i, statuses[i].to_i]
    end

    @changed = @map.vacancy_changed?(vacancys_status)
    @available   = @map.vacancies.where(:status => 0).count
    
    respond_to do |format|
      format.js
    end
  end
end