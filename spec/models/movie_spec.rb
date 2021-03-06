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

  it 'should be associated with actors by role' do
    expect(movie).to respond_to(:roles, :actors)
  end

  it 'should create actor records' do
    movie.save
    movie.actors.create(name: 'Tom Hanks')
    expect(Actor.where(name: 'Tom Hanks').count).to eq 1
  end
end
