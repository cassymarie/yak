class ApplicationController < ActionController::API
    # before_action :authorized

    def encode_token(payload)
      JWT.encode(payload, ENV['JWT_KEY'])
    end

    def get_auth
      request.headers['Authorization']
    end

    def decoded_token
        JWT.decode(get_auth, ENV['JWT_KEY'])[0]["user_id"]
    end

    def logged_in_user
      @user = User.find_by(id: decoded_token)
    end

    def logged_in?
      !!logged_in_user
    end

    def authorized
      render json: { message: 'Please log in'}, status: :unauthorized unless logged_in?
    end

end
