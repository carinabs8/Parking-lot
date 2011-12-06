class VacancyStatus < ActiveRecord::Base
  belongs_to :status_controll, :dependent => :destroy
  belongs_to :vacancy
end
