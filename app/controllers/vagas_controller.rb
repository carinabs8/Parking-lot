class VagasController < ApplicationController
  before_filter :require_user
  
  def index
    @search = Vaga.search(params[:search])
    @vagas = @search.page(params[:page]).order("updated_at DESC")
  end

  def show
    @vaga = Vaga.where(:codigo => params[:id]).first
  end

  def new
    @vaga = Vaga.new
  end

  def edit
    @vaga = Vaga.where(:codigo => params[:id]).first
  end

  def update
    @vaga = Vaga.find(params[:id])
    
    if @vaga.update_attributes(params[:vaga])
      flash[:success] = "Vaga atualizada com sucesso!"
      redirect_to vagas_path
    else
      render :edit
    end
  end

  def coordenates
    @vaga = Vaga.find(params[:id])
  end

  def update_coordendas
    @vaga = Vaga.find(params[:vaga_id])
    @vaga.eixo_x = params[:eixo_x]
    @vaga.eixo_y = params[:eixo_y]
    
    @vaga.save!
    respond_to do |format|
      format.js
    end
  end

  def create
    @vaga = Vaga.new(params[:vaga])
    if @vaga.save
      flash[:notice] = 'Vaga cadastrada com sucesso!'
      redirect_to vagas_url
    else
      render :new
    end
  end

  def destroy
    @vaga = Vaga.find(params[:id])
    @vaga.destroy
    redirect_to vagas_path
  end
end
