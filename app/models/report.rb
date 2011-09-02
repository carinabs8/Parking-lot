class Report < ActiveRecord::Base
  belongs_to :vaga
  
  def self.status(status)
    self.where(:vaga_status => status)
  end
  
  def self.analitic
    self.where(["updated_at >= ? OR updated_at <= ?", Date.today.at_beginning_of_month,Date.today])
  end
  
  def self.getName(report_true)
    names = []
    report_true.select{|key,value| names << Vaga.find(key).codigo}
    names
  end
end
