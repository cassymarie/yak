Rails.application.routes.draw do

  post '/signup', to: 'users#create'
  post '/login', to: 'sessions#login'
  post '/autologin', to: 'sessions#autologin'
 
  namespace :mlb do
    get '/american', to: 'mlb_teams#american'
    get '/national', to: 'mlb_teams#national'
    resources :teams, only: [:index, :show], controller: 'mlb_teams' do 
      resources :roster, only: [:index], controller: 'mlb_players'
    end
    resources :player, only: [:show], controller: 'mlb_players'
    get '/player/:id/career', to: 'mlb_players#career'
    get '/player/:id/images', to: 'mlb_players#images'
  end

  resources :lineups, only: [:index, :show, :create, :destroy] do 
    resources :players, only: [:index,:create, :update, :destroy], controller: 'lineup_players'
  end

end