class VagaObserver < ActiveRecord::Observer
  def after_update(vaga)
    if create_report?(vaga)
      report = Report.new(:vaga_id => vaga.id, :vaga_status => vaga.status)
      report.save!
    end
  end
  
  def create_report?(vaga)
    !vaga.create_report.nil? or !vaga.create_report.zero?
  end
end
