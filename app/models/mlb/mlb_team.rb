class Mlb::MlbTeam < ApplicationRecord

    has_many :mlb_players

    default_scope {order('name ASC')}
  
    def self.get_teams_from_api(season='2020')
        response = Mlb::RapidApi.new('teams', season)
        teams = response.teams
        teams.each{|team| create_from_api(team) }
    end

    def get_roster_from_api()
        response = Mlb::RapidApi.new('roster', '2020', self.id)
        roster = response.results
        roster.each{|player| self.mlb_players.create_from_api(player) }
    end

    def self.create_from_api(team)
        create(
            city: team["city"],
            division: team["division"],
            id: team["team_id"],
            league: team["league"],
            name: team["name"],
            name_full: team["name_display_long"],
            state: team["state"],
            timezone: team["time_zone"],
            venue: team["venue_name"],
            website: "https://www.mlb.com/#{team["name"].downcase.tr(" ", "")}"
        )
    end

    def self.american
        self.all.select{|team| team["league"] === "AL"}
    end

    def self.national
        self.all.select{|team| team["league"] === "NL"}
    end
end
