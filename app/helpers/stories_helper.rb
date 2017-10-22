# frozen_string_literal: true

module StoriesHelper
  def authors
    @authors = User.all.select(:name)
    @authors.to_a
  end

  def genres
    @genres = Genre.all.select(:name)
    @genres.to_a
  end
end
