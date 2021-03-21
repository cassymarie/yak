class Mlb::MlbPlayerSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :nameFirst, :nameLast, :nameFull, :position, :jersey, :bats, :throws, :birthDate, :weight, :heightImp
end