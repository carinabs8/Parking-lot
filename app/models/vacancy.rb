class Vacancy < ActiveRecord::Base
  belongs_to :map
  has_many :status_controlls, :dependent => :destroy
  validates_presence_of :codigo
  validates_uniqueness_of :codigo
  validates_presence_of :cod_arduino
  validates_uniqueness_of :cod_arduino
  validates_presence_of :map_id

  
  AVAILABLE   = 0
  RESTRICTED  = 1
  BUSY        = 2

  cattr_reader :per_page
  @@per_page = 10
  
  scope :vacancy_by_cod, lambda { |cod| where(:codigo => cod) }
end
