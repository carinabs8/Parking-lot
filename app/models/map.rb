class Map < ActiveRecord::Base
  has_many :vagas
  validates_presence_of :photo_file_name
  validates_presence_of :codigo
  
  has_attached_file :photo, :styles => { :small => "900x560" } 
  cattr_reader :per_page
	@@per_page = 10
  
  
  class << self
    def combo
      Map.order("codigo").collect {|c| [c.codigo]}
    end
  end

end
