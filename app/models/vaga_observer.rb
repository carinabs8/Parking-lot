class VagaObserver < ActiveRecord::Observer
  def after_create(vaga)
    if vaga.status == StatusControll::RESTRICTED
      setLog(vaga.cod_arduino, vaga)
    end
  end
  
  def after_update(vaga)
    vaga_status = VagaStatu.where(:vaga_id => vaga.id).last
    status_controll = StatusControll.find(vaga_status.status_controll_id) if !vaga_status.nil?
    
    if (status_controll.nil? or vaga_status.nil?) and vaga.status == StatusControll::RESTRICTED
      setLog(vaga.cod_arduino, vaga)
    elsif vaga_status.status == StatusControll::RESTRICTED and vaga.status == StatusControll::AVAILABLE
       updateLog(status_controll, vaga)
    elsif vaga_status.status != StatusControll::RESTRICTED and vaga.status == StatusControll::RESTRICTED
       updateLog(status_controll, vaga)
    end
  end
  
  private
    def setLog(cod_arduino, vaga)
      statuscontroll = StatusControll.create(:timebegin => Time.now, :cod_arduino => cod_arduino)
      VagaStatu.create(:vaga_id => vaga.id, :status_controll_id => statuscontroll.id, :status => vaga.status)
    end
    
    def updateLog(status_controll, vaga)
      status_controll.update_attribute(:time_end, Time.now)
      VagaStatu.create(:vaga_id => vaga.id, :status_controll_id => status_controll.id, :status => vaga.status)
    end
end
