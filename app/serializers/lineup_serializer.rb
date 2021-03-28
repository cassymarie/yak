class LineupSerializer
    include FastJsonapi::ObjectSerializer
    has_many :games
    has_many :lineup_players
    belongs_to :mlb_team 

    attributes :id, :mlb_team, :season

    set_key_transform :camel
end
  