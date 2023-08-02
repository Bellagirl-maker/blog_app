class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    # @user = current_user
    @user = User.find(params[:user_id])
    @posts = Post.includes(:comment_entries).all
  end

  def show
    @post = Post.includes(:comment_entries).find(params[:id])
    @user = @post.author
    @comments = @post.comment_entries
    @comment = CommentEntry.new
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_post_path(@user, @post), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: 'Post was successfully deleted.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
