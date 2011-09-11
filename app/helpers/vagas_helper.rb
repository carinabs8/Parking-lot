module VagasHelper
  def check_box_status(cod_arduino, vaga_status)
    if cod_arduino == StatusControll::RESTRICTED
     raw  "#{label(:vaga, :status)} #{check_box :vaga, :status, :checked => true}"
    elsif cod_arduino == StatusControll::RESTRICTED || vaga_status.nil?
     raw  "#{label(:vaga, :status)} #{check_box :vaga, :status, :checked => false}"
    end
  end
end
