class Mlb::MlbTeamsController < ApplicationController
    # skip_before_action :authorized, only: [:index]

    def index
        teams = Mlb::MlbTeam.all
        # render json: teams.to_json(except: [:timezone, :created_at, :updated_at])
        render json: Mlb::MlbTeamSerializer.new(teams)
    end 

    def show
        team = Mlb::MlbTeam.find_by(id: params[:id])
        render json: team.to_json(except: [:timezone, :created_at, :updated_at])
    end

    def american
        teams = Mlb::MlbTeam.american
        render json: teams.to_json(except: [:timezone, :created_at, :updated_at])
    end

    def national
        teams = Mlb::MlbTeam.national
        render json: teams.to_json(except: [:timezone, :created_at, :updated_at])
    end

end
