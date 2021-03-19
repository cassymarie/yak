class Lineup < ApplicationRecord
    belongs_to :user
    belongs_to :mlb_team, optional: true

    has_many :lineup_players
    has_many :mlb_players, through: :lineup_players
    has_many :games
end
