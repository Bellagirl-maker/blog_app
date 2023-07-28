class CommentsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comment_entries.build
  end

  def create
    @comment = CommentEntry.new(comment_params)
    @comment.author = current_user
    @post = Post.find(params[:post_id])
    @comment.post = @post

    if @comment.save
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
    else
      render :new, status: 422
    end
  end

  private
  
  def comment_params
    params.require(:comment_entry).permit(:text)
  end
end
