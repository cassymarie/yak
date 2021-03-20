TOPIC = {
    teams: 'team_all_season',
    roster: 'roster_40',
    player: 'player_info',
    stats_hitter: 'sport_hitting_tm',
    stats_pitcher: 'sport_pitching_tm',
    games: 'org_game_type_date_info'
}

YEAR=2020

class Mlb::RapidApi
attr_reader :results, :teams
    def initialize(type, season=YEAR, team_id='', player_id='')
        @results = ''
        query_topic = TOPIC[type.to_sym]
        query = case type
                when 'teams'
                    "season='#{season}'"
                when 'roster'
                    "team_id='#{team_id}'"
                when 'player'
                    "sport_code='mlb'&player_id='#{player_id}'"
                when 'stats_hitter'
                    "season='#{season}'&player_id='#{player_id}'&league_list_id='mlb'&game_type='R'"
                when 'stats_pitcher'
                    "season='#{season}'&player_id='#{player_id}'&league_list_id='mlb'&game_type='R'"
                when 'games'
                    "game_type='R'&season='#{season}'"
                end

        url = "https://mlb-data.p.rapidapi.com/json/named.#{query_topic}.bam?#{query}"

        response = Excon.get(
            url,
            headers: {
                'X-RapidAPI-Host' => URI.parse(url).host,
                'X-RapidAPI-Key' => ENV.fetch('REACT_APP_RAPID_API_KEY')
            })
        return nil if response.status != 200

        results = JSON.parse(response.body)
        filtered_results = results["#{query_topic}"]["queryResults"]["row"]

        if type === 'teams'
            @teams = filtered_results.select{|t| t["sport_code"] === "mlb" && t["division"] != ""}
        else
            @results = filtered_results
        end 
    end

end