require 'rails_helper'

describe Post, type: :request do
  before do
    @user = User.create(name: 'Bella', photo: 'photo.url', bio: 'a nice bio', post_counter: 0)
    @post = Post.create(author: @user, title: 'New post is here', text: 'This is the text for the post',
                        likes_counter: 0,
                        comments_counter: 0)
  end

  describe 'routes with post_controller' do
    it 'should render the index action correctly' do
      get "/users/#{@user.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include('All Posts')
    end

    it 'should render the show action correctly' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include("#{@post.title} by #{@user.name}")
    end
  end
end
