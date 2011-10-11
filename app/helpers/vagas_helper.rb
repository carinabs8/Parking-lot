module VagasHelper
  def check_box_status(vaga)
    if vaga.vaga_status.last.nil? || vaga.vaga_status.last.status != StatusControll::RESTRICTED
     raw  "#{label(:vaga, :status)} #{check_box :vaga, :status, :checked => false}"
    elsif vaga.vaga_status.last.status == StatusControll::RESTRICTED
     raw  "#{label(:vaga, :status)} #{check_box :vaga, :status, :checked => true}"
    end
  end
end
