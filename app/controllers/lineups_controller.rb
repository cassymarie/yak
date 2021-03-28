class LineupsController < ApplicationController

    def index
        lineups = logged_in_user.lineups
        render json: LineupSerializer.new(lineups, {include: [:lineup_players]})
    end

    def create
        lineup = logged_in_user.lineups.create(lineup_params)
        render json: lineup.to_json
    end

    def show
        lineup = Lineup.find(params[:id])
        render json: LineupSerializer.new(lineup, {include: [:lineup_players]})
    end

    private
    def lineup_params
        params.require(:lineup).permit(:id, :mlb_team_id, :season)
    end
end
