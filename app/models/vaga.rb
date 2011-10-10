class Vaga < ActiveRecord::Base
  belongs_to :map
  has_many :vaga_status
  validates_presence_of :codigo
  validates_uniqueness_of :codigo
  validates_presence_of :cod_arduino
  validates_uniqueness_of :cod_arduino
  validates_presence_of :map_id
  
  attr_accessor :status

  cattr_reader :per_page
  @@per_page = 10
end
