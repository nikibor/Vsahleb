class AddGenreToStory < ActiveRecord::Migration[5.1]
  def change
    add_reference :lines, :story, foreign_key: true, null: true
    add_reference :stories, :user, foreign_key: true, null: true
  end
end
