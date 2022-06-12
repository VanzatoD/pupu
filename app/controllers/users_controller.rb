class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @follow = @user.followers.find_by(follower: current_user)
    @posts = Post.where(user: @user)
    @comment = Comment.new
    authorize @user
  end
end
