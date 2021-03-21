YEAR=2021

class Mlb::MlbStats

    attr_reader :stats

    def initialize(player, stats_type)

        query_type = player.position_num === 1 ? 'stats_pitcher' : 'stats_hitter'

        if stats_type === 'career'
            starting_year = player.debut_date ? player.debut_date.year : YEAR
            career = []
            (starting_year..YEAR).each do |season|
                career << Mlb::RapidApi.new(query_type, season, '', player.id).results
            end 
            @stats = career
        else
            @stats = Mlb::RapidApi.new(query_type, YEAR, '', player.id).results
        end
    end

end
