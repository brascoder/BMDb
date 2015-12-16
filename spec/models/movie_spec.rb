require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) { Movie.new() }

  before(:each) do
    movie.title = 'Forest Gump'
    movie.genre = 'Drama'
    movie.description = 'Life is like a box of chocolates'
  end

  it 'is valid' do
    expect(movie).to be_valid
  end

  it 'is invalid with no title' do
    movie.title = nil
    expect(movie).to be_invalid
  end

  it 'is invalid with no genre' do
    movie.genre = nil
    expect(movie).to be_invalid
  end
end
