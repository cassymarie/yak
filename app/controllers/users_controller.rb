class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def create
        @user = User.create(user_params)
        @user.email.downcase!
        @user.provider = 'email'

        if @user.valid? 
            @token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user, {include: [:teams]}), jwt: @token }, status: :created
        else
           render json: { error: 'failed to create User' }, status: :not_acceptable
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :uid, :provider)
    end
end