class UserSerializer
    include FastJsonapi::ObjectSerializer
    belongs_to :mlb_team 
    has_many :lineups
    attributes :id, :username, :name_first, :name_last
end
  