Rails.application.routes.draw do
  resources :players
  resources :users, only: [:create]
  resources :teams
  resources :players

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # get '/mlbTeams', to: 'teams#mlb'
  namespace :mlb do
    resources :mlb_teams, only: [:index, :show] do 
      resources :mlb_players, only: [:index]
    end
    get '/mlb_player/:id/stats', to: 'mlb_players#stats'
  end

end