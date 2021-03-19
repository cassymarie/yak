class Mlb::MlbTeamsController < ApplicationController
    # skip_before_action :authorized, only: [:index]

    def index
        teams = Mlb::MlbTeam.all
        render json: teams.to_json(
            except: [:timezone, :created_at, :updated_at])
    end

    def show
        team = Mlb::MlbTeam.find_by(id: params[:id])
        render json: team.to_json(except: [:timezone, :created_at, :updated_at])
    end

end
