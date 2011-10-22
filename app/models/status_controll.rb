class StatusControll < ActiveRecord::Base
  cattr_reader :per_page
	@@per_page = 10
  
  has_many    :vagas
  belongs_to  :vaga
  AVAILABLE   = "0"
  RESTRICTED  = "1"
  BUSY        = "2"
end
