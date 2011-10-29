FactoryGirl.define do
  factory(:map) do
    sequence(:codigo){|cod|
      "MapCod_#{cod}"
    }
    sequence(:photo_file_name){|cod|
      "FOTO_FILE#{cod}"
    }
    photo_file_size 10
    photo_updated_at Time.now
  end
end