class LineupSerializer
    include FastJsonapi::ObjectSerializer
    has_many :games
    has_many :lineup_players
    attributes :id, :mlb_team_id, :season
end
  