#encoding: UTF-8
class Admin::VacanciesController < ApplicationController
  before_filter :require_user
  before_filter :exist_map?, :only => [:new, :create]
  
  def index
    @map = Map.first
    @search = Vacancy.search(params[:search])
    @vacancies = @search.page(params[:page]).order("updated_at DESC")
  end

  def show
    @vacancy = Vacancy.vacancy_by_cod(params[:id]).first
  end

  def new
    @vacancy = Vacancy.new
  end

  def edit
    @vacancy = Vacancy.vacancy_by_cod(params[:id]).first
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    
    if @vacancy.update_attributes(params[:vacancy])
      flash[:success] = "Vacancy atualizada com sucesso!"
      redirect_to vacancies_path
    else
      render :edit
    end
  end

  def coordenates
    @vacancy = Vacancy.find(params[:id])
  end

  def update_coordendas
    
    @vacancy = Vacancy.find(params[:vacancy_id])
    @vacancy.eixo_x = params[:eixo_x]
    @vacancy.eixo_y = params[:eixo_y]
    
    @vacancy.save!
    respond_to do |format|
      format.js {render :layout => false}
    end
    
  end

  def create
    @vacancy = Vacancy.new(params[:vacancy])
    if @vacancy.save
      flash[:notice] = 'Vacancy cadastrada com sucesso!'
      redirect_to vacancies_url
    else
      render :new
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    @vacancy.destroy
    redirect_to vacancies_path
  end
  
  private
    def exist_map?
      unless Map.first
        flash[:vacancy] = t(:vacancy_without_map)
        redirect_to vacancies_path(:type => :warning)
      end
    end
end
