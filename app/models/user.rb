class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: {message: ' already exists, Please Login to Continue', case_sensitive: false }

    has_many :teams
end
