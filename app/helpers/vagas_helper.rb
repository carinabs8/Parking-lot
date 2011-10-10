module VagasHelper
  def check_box_status(vaga)
    puts vaga.inspect
    puts vaga.vaga_status.last.status
    if vaga.id.nil? || vaga.vaga_status.last.status != StatusControll::RESTRICTED
     raw  "#{label(:vaga, :status)} #{check_box :vaga, :status, :checked => false}"
    elsif vaga.vaga_status.last.status == StatusControll::RESTRICTED
     raw  "#{label(:vaga, :status)} #{check_box :vaga, :status, :checked => true}"
    end
  end
end
