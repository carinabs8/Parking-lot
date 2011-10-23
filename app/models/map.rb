class Map < ActiveRecord::Base
  has_many :vagas, :dependent => :destroy
  validates_presence_of :photo_file_name
  validates_presence_of :codigo
  validates_uniqueness_of :codigo
  
  has_attached_file :photo, :styles => { :small => "900x560" }
  cattr_reader :per_page
	@@per_page = 10
  
  
  class << self
    def combo
      Map.order("codigo").collect {|c| [c.codigo]}
    end
    
    def changed?(map, vacancys, status)
      status.shift
      vacancys.shift

      changed = false
      i = 0
      map.vagas.each do |sv|
        if !map.vagas.include?(vacancys[i][5..(vacancys[i].length)])
          changed = true
          break
        elsif sv.codigo == vacancys[i][5..(vacancys[i].length)]
          if sv.vaga_status.last.status != status[i]
            changed = true
            break
          end
          i = i+1
        end
      end
      return changed
    end
  end

end
