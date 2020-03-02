require 'rails_helper'

describe MoviesController do
	describe 'finds movies with same director' do
		it 'calls the model instance method to find similar movies' do
			fake_movie = instance_double(Movie, :director => 'abcd')
			Movie.stub(:find).and_return(fake_movie)
			expect(fake_movie).to receive(:find_similar_movies)
			get :search_directors, {:id => 42}
		end
		context 'the given movie has a director' do
			it 'selects the search_directors view for rendering' do
				fake_movie = instance_double(Movie, :director => 'abcd')
				Movie.stub(:find).and_return(fake_movie)
				fake_movie.stub(:find_similar_movies)
				get :search_directors, {:id => 42}
				expect(response).to render_template('search_directors')
			end
			it 'makes the results available to the view' do
				fake_movie = instance_double(Movie, :director => 'abcd')
				Movie.stub(:find).and_return(fake_movie)
				fake_results = [instance_double(Movie, :director => 'abcd'), instance_double(Movie, :director => 'abcd')]
				fake_movie.stub(:find_similar_movies).and_return(fake_results)
				get :search_directors, {:id => 42}
				expect(assigns(:similar_movies)).to eq(fake_results)
			end
		end
		context 'the given movie has no director info' do
			it 'selects the index view for rendering' do
				fake_movie = instance_double(Movie, :title => 'efgh')  # Title is necessary for error flash
				Movie.stub(:find).and_return(fake_movie)
				get :search_directors, {:id => 42}
				expect(response).to render_template('index')
			end
		end
	end
end