class CreatePostsubs < ActiveRecord::Migration
  def change
    create_table :postsubs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.timestamps null: false
    end
    add_index :postsubs, [:post_id, :sub_id], unique: true
    remove_column :posts, :sub_id
  end
end
