# class Mlb
  class Mlb::MlbTeamSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :id, :name, :city, :state, :league, :division, :base_url
  end

