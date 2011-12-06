module VacanciesHelper
  def check_box_status(vacancy)
    status = ""
    if vacancy.status == Vacancy::RESTRICTED
     status << "#{label(:vacancy, :status)} #{check_box :vacancy, :status, :checked => true}"
    elsif vacancy.status == Vacancy::AVAILABLE
     status <<  "#{label(:vacancy, :status)} #{check_box :vacancy, :status, :checked => false}"
    end
    return raw status
  end
end
