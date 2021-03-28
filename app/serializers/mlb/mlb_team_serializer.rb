# class Mlb
  class Mlb::MlbTeamSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :name, :city, :state, :league, :division, :fullName, :website, :logo, :color1, :venue, :color2, :lineups
    # has_many :mlb_players
    has_many :lineups
    set_key_transform :camel
  end

