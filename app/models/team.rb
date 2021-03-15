class Team < ApplicationRecord
    has_many :players
    has_many :stats
    has_many :games
end
