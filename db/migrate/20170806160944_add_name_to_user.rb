class AddNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string, null: false, unique: true
    add_index :users, :name
    change_column :users, :email, null: false, unique: true
  end
end
