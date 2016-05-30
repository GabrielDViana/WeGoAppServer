class RatingsController < ApplicationController
  def new
  end

  def create
    @current_user = User.find_by_auth_token(params[:user_auth_token])
    @rating = Rating.new(rating_params)
    @rating.user = @current_user
    @current_user.update_attributes(rating_params[:user_attributes])
    @company = Company.find_by_token(params[:company_token])
    @rating.company = @company
    if @rating.save
      render json: @rating
    else
      render action: 'new'
    end
  end

private

  def rating_params
    params.require(:rating).permit(:id, :rate, user_attributes: [:id, :complete_name])
  end
end
