Rails.application.routes.draw do
  resources :players
  resources :users, only: [:create]
  resources :teams
  resources :players

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  get '/mlbTeams', to: 'teams#mlb'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
