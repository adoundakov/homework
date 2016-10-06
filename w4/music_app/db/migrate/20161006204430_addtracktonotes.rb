class Addtracktonotes < ActiveRecord::Migration[5.0]
  def change
    add_column :notes, :track_id, :integer, null: false, index: true
  end
end
