Rails.application.routes.draw do
  root 'movies#index'
  resources :movies, except: [:edit, :update]
  get '/search' => 'movies#search'
end
