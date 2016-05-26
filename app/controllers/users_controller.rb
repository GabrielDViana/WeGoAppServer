class UsersController < ApplicationController

skip_before_filter :verify_authenticity_token, :only => [:update]

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      puts @user.errors
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

end
