Rails.application.routes.draw do
  # resources :players, only: [:index, :show]
  # resources :users, only: [:create]
  # resources :teams
  # resources :players

  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
 
  namespace :mlb do
    resources :teams, only: [:index], controller: 'mlb_teams' do 
      resources :roster, only: [:index], controller: 'mlb_players'
    end
    resources :player, only: [:show], controller: 'mlb_players'
    get '/player/:id/career_stats', to: 'mlb_players#career_stats'
    get '/player/:id/season_stats', to: 'mlb_players#season_stats'
  end

end