class MlbTeam < ApplicationRecord
# attr_accessor :id, :name, :venue, :city, :state, :division, :league, :base_url, :website_url, :timezone

    def self.get_teams_from_api(season='2020')
        response = ApiCall.new(season)
        teams = response.mlb_teams
        teams.each{|team| create_from_api(team) }
    end

    def self.create_from_api(team)
        create(
            id: team["team_id"],
            name: team["name_display_long"],
            venue: team["venue_name"],
            city: team["city"],
            state: team["state"],
            division: team["division"],
            league: team["league"],
            base_url: team["base_url"],
            website_url: team["website_url"],
            timezone: team["time_zone"]
        )
    end

    def self.american
        self.all.select{|team| team["league"] === "AL"}
    end

    def self.national
        self.all.select{|team| team["league"] === "NL"}
    end
end
