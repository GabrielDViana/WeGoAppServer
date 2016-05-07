class UsersController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => [:update]

  def create
    if (User.create(user_params).valid?)
      User.create(user_params)
      puts "Delete"
    elsif
      User.find_by(email: user_params.email)
      puts "Delete"
    end
  end

  def login
    user = User.find_by_email(params[:email])
    if !user.blank?
      if user && user.authenticate(params[:password])
        session[:user_token] = user.token
        render json: User.find_by(token: session[:user_token])
      end
    elsif user.blank?
      user = User.create(user_params)
      User.login(user)
    end
  end

  def login_twitter
    user = User.find_by_id_social(params[:id_social])
    if !user.blank?
      if user && user.authenticate(params[:password])
        session[:user_token] = user.token
        render json: User.find_by(token: session[:user_token])
      end
    elsif user.blank?
      user = User.create(login_twitter_params)
      User.login(user)
    end
  end

  def show
    @users = User.all
    render json: @users
  end

  private
  def user_params
    params.require(:user).permit(:name , :email, :id_social, :password,
      :password_confirmation, :birthday, :gender)
  end

  private
  def login_twitter_params
    params.require(:user).permit(:name, :email, :id_social, :password,
      :password_confirmation, :birthday, :gender)
  end

end
