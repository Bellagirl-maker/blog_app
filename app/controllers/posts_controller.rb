class PostsController < ApplicationController
  def index
    # Placeholder code for all posts by a given user page view
  end

  def show
    # Placeholder code for single post page view
  end
end


# # app/controllers/posts_controller.rb
# class PostsController < ApplicationController
#     # The index action for all posts by a given user page
#     def index_by_user
#       # Fetch all posts by the given user and store them in an instance variable
#       @user = User.find(params[:user_id])
#       @posts = @user.posts
#     end

#     # The show action for single post page
#     def show
#       # Fetch the post by ID and store it in an instance variable
#       @post = Post.find(params[:id])
#     end
#   end
