class LineupPlayersController < ApplicationController

    def index
        # binding.pry
        players = Lineup.find(params[:lineup_id]).lineup_players
        render json: LineupPlayerSerializer.new(players)
    end

    def create
        lineup = Lineup.find(params[:lineup_id])
        player = lineup.lineup_players.create(lineup_player_params)
        render json: LineupPlayerSerializer.new(player)
    end

    private
    def lineup_player_params
        params.require(:lineup_player).permit(:position, :mlb_player_id,:dh)
    end
end

