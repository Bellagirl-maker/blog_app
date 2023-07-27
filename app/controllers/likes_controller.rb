class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like_entry = LikeEntry.find_or_initialize_by(post: @post, author: current_user)

    if @like_entry.save
      redirect_to @post, notice: 'Post liked!'
    else
      redirect_to @post, alert: 'Unable to like the post.'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like_entry = LikeEntry.find_by(post: @post, author: current_user)

    if @like_entry&.destroy
      redirect_to @post, notice: 'Post unliked.'
    else
      redirect_to @post, alert: 'Unable to unlike the post.'
    end
  end
end
