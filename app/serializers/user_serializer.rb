class UserSerializer
    include FastJsonapi::ObjectSerializer
    has_many :teams
    belongs_to :mlb_team 
    attributes :id, :username, :name_first, :name_last
end
  