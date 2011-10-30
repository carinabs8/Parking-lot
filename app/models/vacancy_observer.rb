class VacancyObserver < ActiveRecord::Observer
  def after_create(vacancy)
    if vacancy.status == Vacancy::RESTRICTED
      setLog(vacancy, StatusControll::RESTRICTED)
    end
  end
  
  def after_update(vacancy)
    status_controll = StatusControll.where(:vacancy_id => vacancy, :current_status => Vacancy::RESTRICTED).last

    if !status_controll.nil?
      updateLog(status_controll, vacancy)
    elsif vacancy.status == Vacancy::RESTRICTED
      setLog(vacancy, Vacancy::RESTRICTED)
    end
  end
  
  private
    def setLog(vacancy, current_status)
      StatusControll.create(:vacancy_id => vacancy.id, :timebegin => Time.now, :current_status => current_status)
    end
    
    def updateLog(status_controll, vacancy)
      old_status = status_controll.current_status
      status_controll.update_attributes(:time_end => Time.now, :current_status => vacancy.status, :old_status => old_status)
    end
end
