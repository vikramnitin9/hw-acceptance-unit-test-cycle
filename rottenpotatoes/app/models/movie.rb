class Movie < ActiveRecord::Base

  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def find_similar_movies
    return Movie.where(:director => self.director).where.not(:id => self.id)
  end
end
