class RelationshipsController < ApplicationController
  def create
    main_user = User.find_by_auth_token(params[:main_user_auth_token])
    user = User.find_by_auth_token(params[:followed_id])
    main_user.follow(user)
  end

  def destroy
    main_user = User.find_by_auth_token(params[:main_user_auth_token])
    user = Relationship.find(params[:id]).followed
    main_user.unfollow(user)
  end
end
