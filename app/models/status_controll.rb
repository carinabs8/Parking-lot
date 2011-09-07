class StatusControll < ActiveRecord::Base
  has_many :vagas
  AVAILABLE   = 0
  RESTRICTED  = 1
  BUSY        = 2
end
