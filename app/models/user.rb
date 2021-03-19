class User < ApplicationRecord
    has_secure_password
    
    belongs_to :mlb_team, optional: true
    has_many :teams
    
    validates :username, presence: true
    validates :username, uniqueness: {message: ' already taken, Please try again'}

end
