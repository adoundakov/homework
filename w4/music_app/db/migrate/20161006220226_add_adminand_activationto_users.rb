class AddAdminandActivationtoUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :activated, :boolean, default: false, null: false
    add_column :users, :activation_token, :string, null: false
    add_column :users, :admin, :boolean, default: false, null: false
  end
end
