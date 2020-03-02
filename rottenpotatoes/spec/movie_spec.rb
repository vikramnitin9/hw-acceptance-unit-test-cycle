require 'rails_helper'

describe Movie do
	describe 'searching for movies with same director' do
		it 'should find all movies by the same director and nothing else' do
			movie0 = Movie.create!({:id => 0, :title => 'Star Wars', :rating => 'PG', :director => 'George Lucas', :release_date => '1977-05-25'})
			movie1 = Movie.create!({:id => 1, :title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25'})
			movie2 = Movie.create!({:id => 2, :title => 'Alien', :rating => 'R', :director => 'Ridley Scott', :release_date => '1979-05-25'})
			movie3 = Movie.create!({:id => 3, :title => 'THX-1138', :rating => 'R', :director => 'George Lucas', :release_date => '1971-03-11'})

			similar_list = movie0.find_similar_movies
			expect(similar_list).to eq([movie3])

			similar_list = movie1.find_similar_movies
			expect(similar_list).to eq([movie2])
		end
	end
end