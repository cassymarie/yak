class UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create]

    def create
        user = User.create(user_params)
        if user.valid? 
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user), token: token }, status: :created
        else
           render json: { error: "Username already taken, Please try again" }, status: :not_acceptable
        end
    end

    private
    def user_params
        params.permit(:id, :username, :password, :name_first, :name_last)
    end
end