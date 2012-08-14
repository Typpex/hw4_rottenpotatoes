require 'spec_helper'
require 'simplecov'
SimpleCov.start 'rails'

describe MoviesController do
  describe 'searching TMDb' do
    it 'should test the route leading to the movie with same director name' do
      get :same_director, {:director=>"Goerges Lucas"}
    end
    it 'should test the method in the Movie model looking for movie with same director' do
      Movie.stub(:find_by_director)
      get :same_director, {:director=>"Goerges Lucas"}
      response.should render_template('same_director')
    end
  end
  
  describe 'Searching for movies produced by Georges Lucas' do
    
  end
end
