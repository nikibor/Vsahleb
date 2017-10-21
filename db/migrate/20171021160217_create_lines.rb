class CreateLines < ActiveRecord::Migration[5.1]
  def change
    create_table :lines do |t|
      t.string :speaker
      t.string :message

      t.timestamps
    end
  end
end
