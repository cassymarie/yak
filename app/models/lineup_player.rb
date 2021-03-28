class LineupPlayer < ApplicationRecord
    belongs_to :mlb_player, :class_name => "Mlb::MlbPlayer"
    belongs_to :lineup
    
end
