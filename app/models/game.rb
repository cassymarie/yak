class Game < ApplicationRecord
    belongs_to :mlb_team
    belongs_to :user, optional: true
    belongs_to :lineup, optional: true
end
