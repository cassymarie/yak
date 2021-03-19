class Lineup < ApplicationRecord
    belongs_to :user
    belongs_to :mlb_team
end
