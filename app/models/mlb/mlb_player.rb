class Mlb::MlbPlayer < ApplicationRecord

    attr_accessor :action_images

    belongs_to :mlb_team
    has_many :lineup_players
    has_many :lineups, through: :lineup_players
    has_many :stats

    default_scope {order('last_name ASC')}

    def self.create_from_api(player)
        roster_player = {
            bats: player["bats"],
            birth_date: player["birth_date"].to_date,
            debut_date: player["pro_debut_date"].to_date,
            first_name: player["name_first"],
            height_feet: player["height_feet"],
            height_inches: player["height_inches"],
            id: player["player_id"],
            jersey_number: player["jersey_number"],
            last_name: player["name_last"],
            name_display_first_last: player["name_display_first_last"],
            position_num: player["primary_position"],
            position_txt: player["position_txt"],
            status: player["status_code"],
            throws: player["throws"],
            weight: player["weight"]
        }

        Mlb::MlbPlayer.find_or_create_by(roster_player)
    end

    def statsCurrent
        Mlb::MlbStats.new(id, 'season').stats
    end

    def statsCareer
        Mlb::MlbStats.new(id, 'career').stats
    end

    def nameLast
        last_name
    end
    def nameFirst
        first_name
    end
    def jersey
        jersey_number
    end
    def nameFull
        name_display_first_last
    end
    def birthDate
        birth_date
    end
    def heightImp
        "#{height_feet}'#{height_inches}"""
    end
    def position
        position_txt
    end

end
