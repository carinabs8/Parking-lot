FactoryGirl.define do
  factory(:map) do
    codigo "map_cod"
    photo_file_name "map_foto"
    photo_file_size 10
    photo_updated_at Time.now
  end
end