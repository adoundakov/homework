class CreateAlbums < ActiveRecord::Migration[5.0]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :band_id, null: false
      t.string :production_type, null: false
      t.string :genre, null: false
      t.timestamps
    end
  end
end
