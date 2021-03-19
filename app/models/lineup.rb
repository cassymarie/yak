class Lineup < ApplicationRecord
    belongs_to :user
    belongs_to :mlb_team
    has_many :lineup_players
    has_many :mlb_players, through: :lineup_players
end
