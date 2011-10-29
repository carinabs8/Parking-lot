FactoryGirl.define do
  factory(:vacancy) do
    map
    especial false
    sequence(:codigo){|cod|
      "CodVacancy_#{cod}"
    }
    sequence(:cod_arduino){|cod|
      "CodArduino_#{cod}"
    }
    factory(:vacancy_map) do
      sequence(:codigo){|cod|
        "Map_Cod_#{cod}"
      }
      sequence(:photo_file_name){|cod|
        "FOTO#{cod}"
      }
      photo_file_size 10
      photo_updated_at Time.now
    end
  end
end