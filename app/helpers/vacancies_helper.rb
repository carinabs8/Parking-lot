module VacanciesHelper
  def check_box_status(vacancy)
    p vacancy.status
    if vacancy.status == Vacancy::RESTRICTED
     raw  "#{label(:vacancy, :status)} #{check_box :vacancy, :status, :checked => true}"
    elsif vacancy.status == Vacancy::AVAILABLE
     raw  "#{label(:vacancy, :status)} #{check_box :vacancy, :status, :checked => false}"
    end
  end
end
