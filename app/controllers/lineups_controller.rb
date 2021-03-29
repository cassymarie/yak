class LineupsController < ApplicationController
    before_action :set_lineup, only: [:show, :destroy]

    def index
        lineups = logged_in_user.lineups
        render json: LineupSerializer.new(lineups, {include: [:lineup_players]})
    end

    def create
        lineup = logged_in_user.lineups.create(lineup_params)
        render json: lineup.to_json
    end

    def show
        render json: LineupSerializer.new(@lineup, {include: [:lineup_players]})
    end

    def destroy
        @lineup.destroy
        render json: @lineup.to_json
    end

    private
    def lineup_params
        params.require(:lineup).permit(:id, :mlb_team_id, :season)
    end

    def set_lineup
        @lineup = Lineup.find_by(id: params[:id])
    end

end
