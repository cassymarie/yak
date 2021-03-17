class ApiCall
    attr_reader :mlb_teams
    def initialize(season='2020')
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
