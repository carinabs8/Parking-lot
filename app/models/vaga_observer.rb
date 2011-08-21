class VagaObserver < ActiveRecord::Observer
  def after_update(vaga)
    if create_report?(vaga)
      report = Report.new(:vaga_id => vaga.id)
      report.save!
    end
  end
  
  def create_report?(vaga)
    debugger
    !vaga.create_report.zero?
  end
end
