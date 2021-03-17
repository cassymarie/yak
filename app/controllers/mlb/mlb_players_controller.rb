class Mlb::MlbPlayersController < ApplicationController

    def index
        team = Mlb::MlbTeam.find_by(id: params[:mlb_team_id])
        render json: team.mlb_players
    end
    
    def stats
        player = Mlb::MlbPlayer.find_by(id: params[:id])
        stats = Mlb::MlbStats.new(player)
        render json: stats
    end

end