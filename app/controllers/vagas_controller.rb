class VagasController < ApplicationController
  
  def index
    @search = Vaga.search(params[:search])
    @vagas = @search.paginate(:all, :page => params[:page], :order =>"updated_at DESC")
  end
  
  def show
    @vaga = Vaga.where(:codigo => params[:id]).first
  end
  
  def new
    @vaga = Vaga.new
  end
  
  def edit
    @vaga = Vaga..where(:codigo => params[:id]).first
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
  
  def update_coordendas
    @vaga = Vaga.find(params[:vaga_id])
    puts @vaga.inspect
    puts params[:eixo_x]
    puts params[:eixo_y]
    @vaga.eixo_x = params[:eixo_x]
    @vaga.eixo_y = params[:eixo_y]
    
    puts @vaga.inspect
    @vaga.save!
    
    render 'update_coordendas', :layout => false
  end
  
  def create
    @vaga = Vaga.new(params[:vaga])
    
    if @vaga.save
      flash[:notice] = 'Vaga cadastrada com sucesso!'
      redirect_to vagas_url
    else
      redirect_to new_vaga_path
    end
  end
  
  def destroy
    @vaga = Vaga.find(params[:id])
    @vaga.destroy
    redirect_to vagas_path
  end
end
