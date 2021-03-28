class Mlb::MlbPlayerSerializer
    include FastJsonapi::ObjectSerializer
    has_many :lineups
    attributes :id, :nameFirst, :nameLast, :nameFull, :position, :jersey, :bats, :throws, :birthDate, :weight, :heightImp

    set_key_transform :camel
end