class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @user = current_user # Assuming you have a method to retrieve the current user in your ApplicationController
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.author
    @comments = @post.comment_entries
    @comment = CommentEntry.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
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


# class PostsController < ApplicationController
#   def index
#     @user = User.find(params[:user_id])
#   end

#   def show
#     @user = User.find(params[:user_id])
#     @post = Post.find(params[:id])
#   end
# end
