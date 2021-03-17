TOPIC = {
        teams: 'team_all_season',
        players: 'roster_team_alltime',
        playerSearch: 'search_player_all',
        playerTeams: 'player_teams',
        player: 'player_info',
        stats: {
            pitcher: {
                projected: 'proj_pecota_pitching', 
                career: 'sport_career_pitching', 
                league: 'sport_career_pitching_lg', 
                season: 'sport_pitching_tm'
            },
            hitter: {
                projected: 'proj_pecota_batting', 
                career: 'sport_career_hitting', 
                league: 'sport_career_hitting_lg', 
                season: 'sport_hitting_tm'
            }
        },
        games: 'org_game_type_date_info'
    }

class ApiCall
    attr_reader :mlb_teams
    def initialize(season='2020')

        queryType = queryTopic[type]

        url = "https://mlb-data.p.rapidapi.com/json/named.team_all_season.bam?season='#{season}'"
        response = Excon.get(
            url,
            headers: {
                'X-RapidAPI-Host' => URI.parse(url).host,
                'X-RapidAPI-Key' => ENV.fetch('REACT_APP_RAPID_API_KEY')
            })
        return nil if response.status != 200

        results = JSON.parse(response.body)
        teams = results["team_all_season"]["queryResults"]["row"]
        @mlb_teams = teams.select{|t| t["sport_code"] === "mlb" && t["division"] != ""}      
    end
end
