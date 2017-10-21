class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.string :name
      t.belongs_to :story, index: true
      t.timestamps
    end
  end
end
