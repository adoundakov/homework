class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string :name, null: false, index: true, unique: true
      t.references :toyable, polymorphic: true, index: true
      t.timestamps null: false
    end
  end
end
