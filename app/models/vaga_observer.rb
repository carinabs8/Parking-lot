class VagaObserver < ActiveRecord::Observer
  def after_create(vaga)
    if vaga.status == StatusControll::RESTRICTED
      setLog(vaga.cod_arduino, StatusControll::RESTRICTED)
      StatusControll.create(:status => StatusControll::RESTRICTED, :timebegin => Time.now, :vaga_id => vaga.id)
    else
      setLog(vaga.cod_arduino, StatusControll::AVAILABLE)
    end
  end
  
  private
    def setLog(cod_arduino, type)
      Logs.merge! :vagas, {"#{cod_arduino}" => type}
    end
end
