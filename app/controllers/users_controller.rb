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
