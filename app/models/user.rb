class User < ApplicationRecord
    has_secure_password
    
    validates :email, presence: true
    validates :email, uniqueness: {message: ' already exists, Please Login to Continue'}

    has_many :teams
end
