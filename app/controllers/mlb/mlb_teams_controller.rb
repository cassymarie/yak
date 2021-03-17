class Mlb::MlbTeamsController < ApplicationController

    def index
        teams = Mlb::MlbTeam.all
        render json: teams
    end

    def show
        team = Mlb::MlbTeam.find_by(id: params[:id])
        render json: team.mlb_players
    end

    # private
    # def team_params
    #     params.require(:team).permit(:id)
    # end
end
