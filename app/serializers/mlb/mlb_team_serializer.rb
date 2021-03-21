# class Mlb
  class Mlb::MlbTeamSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :name, :city, :state, :league, :division, :fullName, :website, :logo, :color1, :color2
    has_many :mlb_players
  end

