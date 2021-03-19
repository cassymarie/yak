class Stat < ApplicationRecord
    belongs_to :mlb_player
    belongs_to :mlb_team
    belongs_to :game
    belongs_to :lineup
end
