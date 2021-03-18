class Mlb::MlbStats

    attr_reader :stats

    def initialize(player, stats_type)
        query_type = player.position_num === 1 ? 'stats_pitcher' : 'stats_hitter'

        if stats_type === 'career'
            starting_year = player.debut_date.year
            career = []
            (starting_year..2020).each do |season|
                career << Mlb::RapidApi.new(query_type, season, '', player.id)
            end 
            @stats = career
        else
            @stats = Mlb::RapidApi.new(query_type, 2020, '', player.id)
        end
    end

end
