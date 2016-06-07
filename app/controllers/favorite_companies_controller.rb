class FavoriteCompaniesController < ApplicationController
  before_action :set_company

  def create
    @favorite = Favorite.create(favorited: @company, user: @current_user)
    if @favorite.save
      render json: @favorite
    end
  end

  def destroy
    Favorite.where(favorited_id: @company.id, user_id: @current_user.id).first.destroy
  end

  private

  def set_company
    @current_user = User.find_by_auth_token(params[:user_auth_token])
    @company = Company.find_by_token(params[:company_token])
  end
end
