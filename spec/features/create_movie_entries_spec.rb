require 'rails_helper'

RSpec.feature "CreateMovieEntries", type: :feature do
  before(:each) do
    visit root_path
  end
  
  scenario 'visitor visits site' do
    expect(page).to have_css 'h2', text: 'Movies'
  end

  scenario 'visitor adds a movie entry' do
    click_link 'Add a movie'
    fill_in 'movie_title', with: 'Forest Gump'
    fill_in 'movie_genre', with: 'Drama'
    fill_in 'actor_string', with: 'Tom Hanks, Robin Wright'
    fill_in 'movie_description', with: 'Life is like a box of chocolates.'
    click_button 'Add'

    expect(page).to have_css '.notice', text: 'The movie has been successfully added.'
    expect(Actor.count).to eq 2
  end
end
