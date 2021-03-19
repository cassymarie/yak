Rails.application.routes.draw do
  # resources :players, only: [:index, :show]
  # resources :teams
  # resources :players

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#login'
  post '/autologin', to: 'sessions#autologin'
 
  namespace :mlb do
    resources :teams, only: [:index, :show], controller: 'mlb_teams' do 
      resources :roster, only: [:index], controller: 'mlb_players'
    end
    resources :player, only: [:show], controller: 'mlb_players'
    get '/player/:id/career_stats', to: 'mlb_players#career_stats'
    get '/player/:id/season_stats', to: 'mlb_players#season_stats'
  end

end