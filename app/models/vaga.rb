class Vaga < ActiveRecord::Base
  belongs_to :map
  validates_presence_of :codigo
  
  cattr_reader :per_page
	@@per_page = 10
  
end
