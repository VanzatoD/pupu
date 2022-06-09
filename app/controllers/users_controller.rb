class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow = @user.followers.find_by(follower: current_user)
    authorize @user
  end
end
