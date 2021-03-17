class TeamsController < ApplicationController

    def index
        teams = Team.all
        render json: teams
    end

    def mlb
        teams = MlbTeam.all
        render json: teams
    end

    private
    def request_api(url)
        response = Excon.get(
        url,
        headers: {
            'X-RapidAPI-Host' => URI.parse(url).host,
            'X-RapidAPI-Key' => ENV.fetch('RAPIDAPI_API_KEY')
        }
        )
        return nil if response.status != 200
        JSON.parse(response.body)
    end
end
