class Mlb::MlbPlayer < ApplicationRecord

    belongs_to :mlb_team

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
            position_num: player["primary_position"].to_i,
            position_txt: player["position_txt"],
            status: player["status"],
            throws: player["throws"],
            weight: player["weight"]
        }

        Mlb::MlbPlayer.find_or_create_by(roster_player)
    end

    
end
