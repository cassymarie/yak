class Mlb::MlbStats

    attr_reader :stats

    def initialize(player)
        starting_year = player.debut_date.year
        query_type = player.position_num === 1 ? 'stats_pitcher' : 'stats_hitter'
        career = []
        (starting_year..2020).each do |season|
            career << Mlb::RapidApi.new(query_type, season, '', player.id)
        end 
        @stats = career
    end

end
