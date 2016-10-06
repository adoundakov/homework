class CreateTracks < ActiveRecord::Migration[5.0]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :album_id, null: false
      t.string :track_type, null: false
      t.text :lyrics
      t.timestamps
    end
  end
end
