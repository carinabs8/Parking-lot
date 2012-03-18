class User::MapsController < ViewMapsController
  def show
    @map = Map.where(:codigo => params[:id]).first
    @available = @map.vacancies.where(:status => 0).count
    render :layout => "application_user"
  end
end