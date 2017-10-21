class AddGenreToStory < ActiveRecord::Migration[5.1]
  def change
    add_reference :stories, :genre, foreign_key: true, null: true
    add_reference :lines, :story, foreign_key: true, null: true
    add_reference :users, :story, foreign_key: true, null: true
  end
end
