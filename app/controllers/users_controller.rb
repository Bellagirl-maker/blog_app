class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts.order(created_at: :desc).limit(5)
    # posts_with_comments = @user.all_posts_with_comments
  end
end
