class MapsController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :update, :destroy, :edit]
  def index
    @search = Map.where(:active => true).search(params[:search])
    @maps = @search.page(params[:page]).order("updated_at DESC")
    @map = Map.new
  end

  def show
    @map = Map.where(:codigo => params[:id]).first
    @vagas = Vaga.all
  end

  def new
    @map = Map.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @map = Map.new(params[:map])
    if @map.save
      flash[:success] = "Mapa salvo com sucesso!"
      redirect_to map_path(@map.codigo)
    else
      flash[:error] = "Mapa ou Codigo com formato invalido!"
      redirect_to maps_path
    end
  end
  
  def edit
    @map = Map.find(params[:id])
  end
  
  def update
    @map = Map.find(params[:id])
    if @map.update_attributes(params[:map])
      flash[:success] = "Mapa atualizado com sucesso!"
      redirect_to map_path(@map.codigo)
    else
      flash[:error] = "Mapa ou Codigo com formato invalido!"
      redirect_to maps_path
    end
  end

  def destroy
    @map = Map.find(params[:id])
    @map.update_attribute(:active, false)
    redirect_to maps_path
  end
  
  def reload_map
    @map      = Map.where("id = ?", params[:map_id]).first
    
    vacancys  = params[:vacancys].split(',')
    status    = params[:status].split(',')

    @changed = Map.changed?(@map, vacancys, status)

    respond_to do |format|
      format.js
    end
  end
end