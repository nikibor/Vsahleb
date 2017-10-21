module StoriesHelper
  def authors
    @authors = User.all.select(:name)
    return @authors.to_a
  end

  def genres
    @genres = Genre.all.select(:name)
    return @genres.to_a
  end
end
