class LineupsController < ApplicationController

    def index
        # lineups = logged_in_user.lineups
        lineups = User.find(2).lineups
        render json: LineupSerializer.new(lineups, {include: [:lineup_players]})
        # render json: lineups.to_json(except: [:created_at, :updated_at])
    end

    def show
    end

end
