class Stat < ApplicationRecord
    belongs_to :player
    belongs_to :team
    belongs_to :game
end
