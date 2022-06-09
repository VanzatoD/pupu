class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.create(user: current_user, post: @post)
    redirect_to post_path(@post)
    authorize @like
  end

  def destroy
    @like = Like.find(params[:id])
    authorize @like
    @like.destroy
  end

end
