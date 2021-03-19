class SessionsController < ApplicationController
    # skip_before_action :authorized

    def login
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user), token: token }
        else
           render json: { error: 'Username and/or Password are Incorrect' }, status: :not_acceptable
        end
    end

    def autologin
        render json: { user: UserSerializer.new(logged_in_user) }
    end

    private
    def sessions_params
        params.permit(:id, :username, :password)
    end
end