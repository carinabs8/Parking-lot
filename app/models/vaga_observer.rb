class VagaObserver < ActiveRecord::Observer
  
  def after_update(vaga)
    if create_report?(vaga)
      #report = Report.new(:vaga_id => vaga.id, :vaga_status => vaga.status)
      #report.save!
    end
  end
  def after_create(vaga)
    if vaga.status == "1"
      StatusControll.create(:status => StatusControll::RESTRICTED, :timebegin => Time.now, :vaga_id => vaga.id)
    end
  end
    
  def create_report?(vaga)
    #!vaga.create_report.nil? or !vaga.create_report.zero?
  end
end
