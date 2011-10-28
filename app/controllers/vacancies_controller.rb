class VacanciesController < ApplicationController
  before_filter :require_user
  
  def index
    @search = Vacancy.search(params[:search])
    @vacancies = @search.page(params[:page]).order("updated_at DESC")
  end

  def show
    @vacancy = Vacancy.where(:codigo => params[:id]).first
  end

  def new
    @vacancy = Vacancy.new
  end

  def edit
    @vacancy = Vacancy.where(:codigo => params[:id]).first
  end

  def update
    @vacancy = Vacancy.find(params[:id])
    
    if @vacancy.update_attributes(params[:vaga])
      flash[:success] = "Vacancy atualizada com sucesso!"
      redirect_to vagas_path
    else
      render :edit
    end
  end

  def coordenates
    @vacancy = Vacancy.find(params[:id])
  end

  def update_coordendas
    @vacancy = Vacancy.find(params[:vaga_id])
    @vacancy.eixo_x = params[:eixo_x]
    @vacancy.eixo_y = params[:eixo_y]
    
    @vacancy.save!
    respond_to do |format|
      format.js
    end
  end

  def create
    @vacancy = Vacancy.new(params[:vaga])
    if @vacancy.save
      flash[:notice] = 'Vacancy cadastrada com sucesso!'
      redirect_to vagas_url
    else
      render :new
    end
  end

  def destroy
    @vacancy = Vacancy.find(params[:id])
    @vacancy.destroy
    redirect_to vagas_path
  end
end
