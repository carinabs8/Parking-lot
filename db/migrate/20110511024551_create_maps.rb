class CreateMaps < ActiveRecord::Migration
  def self.up
    create_table :maps do |t|
      t.string    :codigo
      t.string    :photo_file_name
      t.string    :photo_content_type
      t.integer   :photo_file_size
      t.datetime  :photo_updated_at
      t.boolean   :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :maps
  end
end
