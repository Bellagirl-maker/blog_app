class LikesController < ApplicationController
  def create
    @like_entry = LikeEntry.new
    @like_entry.author = current_user
    @like_entry.post_id = params[:post_id]

    if @like_entry.save
      redirect_to(request.referrer || root_path)
    else
      render :new, status: 422
    end
  end
end
