class Admin::MapsController < ViewMapsController
  before_filter :require_user, :only => [:new, :create, :update, :destroy, :edit]

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
    @map.destroy
    redirect_to maps_path
  end  
end