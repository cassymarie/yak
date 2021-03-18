class Mlb::MlbTeamsController < ApplicationController

    def index
        teams = Mlb::MlbTeam.all
        render json: teams.to_json(
            except: [:timezone, :created_at, :updated_at])
    end

end
