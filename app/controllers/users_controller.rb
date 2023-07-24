class UsersController < ApplicationController
  def index
    # Placeholder code for all users page view
  end

  def show
    # Placeholder code for single user page view
  end
end



# # app/controllers/users_controller.rb
# class UsersController < ApplicationController
#   def users
#     # Fetch all users from the database (assuming User model exists)
#     @users = User.all
#   end

#   def user
#     # Fetch the user by id from the database (assuming User model exists)
#     @user = User.find(params[:id])
#   end

#   def all_posts_by_user
#     # Fetch all posts by a given user (assuming there's a Post model with a 'user_id' column)
#     @user = User.find(params[:user_id])
#     @posts = @user.posts
#   end
# end
