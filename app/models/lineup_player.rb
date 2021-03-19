class LineupPlayer < ApplicationRecord
    belongs_to :mlb_player
    belongs_to :lineup
end
