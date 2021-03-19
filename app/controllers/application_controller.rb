class ApplicationController < ActionController::API
    # before_action :authorized

    def encode_token(payload)
      JWT.encode(payload, ENV['JWT_KEY'])
    end

    def auth_header
      request.headers['Authorization']
    end

    def decoded_token
      if auth_header
        JWT.decode(auth_header, ENV['JWT_KEY'])[0]["user_id"]
      end
    end

    def logged_in_user
      User.find_by(id: decoded_token)
    end

    # def authorized
    #   render json: { message: 'Please log in'}, status: :unauthorized unless logged_in?
    # end

end
