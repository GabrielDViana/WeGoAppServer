class FavoriteController < ApplicationController

  def create
    @current_user = User.find_by_auth_token(params[:user_auth_token])
    @favorite = Favorite.new(favorite_params)
    @favorite.user = @current_user
    @current_user.update_attributes(favorite_params[:user_attributes])
    @company = Company.find_by_token(params[:company_token])
    @favorite.company = @company
    if @favorite.save
      render json: @favorite
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:id, :rate, user_attributes: [:id, :name])
  end

end
