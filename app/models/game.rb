class Game < ApplicationRecord
    belongs_to :mlb_team, optional: true
    belongs_to :lineup
    belongs_to :user
    has_many :stats
    accepts_nested_attributes_for :stats
end
