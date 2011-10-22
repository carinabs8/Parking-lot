class VagaStatu < ActiveRecord::Base
  belongs_to :status_controll
  belongs_to :vaga

  class << self
    
    def report
      vaga_status = {}
      
      self.all.each do |vs|
        if self.where(:status_controll_id => vs.status_controll_id).length == 2
          if vaga_status.has_key?(vs.status_controll.cod_arduino)
            vaga_status[vs.status_controll.cod_arduino].merge!({"2" => vs})
          else
            vaga_status.merge!({vs.status_controll.cod_arduino => {"1" => vs}})
          end
        end
      end
      vaga_status
    end
    
  end
end
