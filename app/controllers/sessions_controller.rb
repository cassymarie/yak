class SessionsController < ApplicationController
    layout "login"
    skip_before_action :verify_authenticity_token
    

    def new
    end
    
    #Google Omniauth Callback
    def omniauth
       user = User.find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |u|
            u.email = auth[:info][:email].downcase
            u.password = SecureRandom.hex(24)
       end

       if user.valid?
        session[:user_id] = user.id
       else 
        flash[:message] = 'Login through Google was NOT Successful'
       end
    end
    
    def create
        user = User.find_by(email: params[:user][:email].downcase)
        @user = user.try(:authenticate, params[:user][:password])

        if @user
            session[:user_id] = @user.id
        else
            if user.nil?
                flash[:alert] = 'Email not found. Sign Up to continue.'
            else
                flash[:alert] = 'Email and/or Password are incorrect.  Please try again.'
                @user = user
            end
        end
    end

    def destroy
        session.delete :user_id
    end

    private
    def auth
        request.env['omniauth.auth']
    end
end