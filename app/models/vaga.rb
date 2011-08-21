class Vaga < ActiveRecord::Base
  belongs_to :map
  validates_presence_of :codigo
  validates_uniqueness_of :codigo
  validates_presence_of :map_id
  
  attr_accessor :create_report

  cattr_reader :per_page
  @@per_page = 10
end
