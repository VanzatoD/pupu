class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post)
    @post = Post.new
    @chatrooms = policy_scope(Chatroom).order(created_at: :desc)
    @chatrooms = Chatroom.all
    @user = current_user
    @following = Follow.where(follower_id: current_user.id)

  end

  # def new

  # end

  def create
    @post = Post.new(post_params)
    authorize @post
    @post.user = current_user
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])

    @likes = @post.likes.count

    @comment = Comment.new
    @comments = Comment.where(post: @post)
    authorize @post
  end

  # def like
  #   @post = Post.all.find(params[:id])
  #   Like.create(user_id: current_user.id, post_id: @post.id)
  #   redirect_to post_path(@post)
  #   authorize @post
  # end

  private

  def post_params
    params.require(:post).permit(:content, :photo, :video, :tag_list)
  end
end
