require 'rails_helper'

describe User, type: :request do
  before do
    @user = User.create(name: 'Bella', photo: 'photo.http', bio: 'Awesome and awesome', post_counter: 0)
  end

  describe 'routes with user_controller' do
    it 'should render the index action correctly' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('users/index')
      expect(response.body).to include('Here is a list of all users')
    end

    it 'should render the show action correctly' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
      expect(response).to render_template('users/show')
      expect(response.body).to include(@user.bio.to_s)
    end
  end
end
