class SessionsController < ApplicationController
    # skip_before_action :authorize

    def new
    end

    def create
      user = User.find_by_email(params[:email])
      if user.authenticate(params[:password])
        cookies[:auth_token] = user.auth_token
        @current_user = User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
        render json: @current_user.to_json(:include => :companies )
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end
    end

    def login_twitter
      user = User.find_by_id_social(params[:id_social])
      if user.authenticate(params[:password])
        cookies[:auth_token] = user.auth_token
        @current_user = User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
        render json: @current_user.to_json(:include => :companies )
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end
    end

    def destroy
        cookies.delete(:auth_token)
    end

    private
    def login_twitter_params
      params.require(:user).permit(:name, :email, :id_social, :password,
        :password_confirmation, :birthday, :gender)
    end
end
