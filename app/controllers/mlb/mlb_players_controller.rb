class Mlb::MlbPlayersController < ApplicationController

    before_action :set_mlb_player, only: [:show, :stats, :career, :images]

    def index
        team = Mlb::MlbTeam.find_by(id: params[:team_id])
        roster = team.mlb_players
        render json: Mlb::MlbPlayerSerializer.new(roster)
    end

    def show
        render json: Mlb::MlbPlayerSerializer.new(@player)
    end
    
    def career
        stats = Mlb::MlbStats.new(@player, 'career')
        render json: stats
    end

    def stats
        stats = Mlb::MlbStats.new(@player.id)
        render json: stats
    end

    def images
        images = Mlb::ImageSearch.new(@player.id)
        render json: images
    end

    def set_mlb_player
        @player = Mlb::MlbPlayer.find_by(id: params[:id])
    end
end