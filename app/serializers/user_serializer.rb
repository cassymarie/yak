class UserSerializer
    include FastJsonapi::ObjectSerializer
    has_many :teams
    attributes :id, :email
end
  