class UniqueUsers < ActiveRecord::Migration[5.1]
  def change
    add_index :users, :email, unique: true
    add_index :genres, :name, unique: true
  end
end
