require 'rails_helper'

RSpec.describe "User", type: :feature do
  before(:each) do
    @user=User.create(name: 'Sarkodie', photo: '/path/to/photo1.jpg', post_counter: 0, bio: 'A beautiful bio')
    @post= Post.create(
      title: "Post title",
      text: "Post text",
      comments_counter: 0,
      likes_counter: 0,
      author: @user)
  end 
  # let!(:user) { User.create(name: "Sarkodie", photo: "/path/to/photo1.jpg", post_counter: 10) }

  # before do
  #   5.times do |n|
  #     post = Post.create(
  #       title: "Post title #{n + 1}",
  #       text: "Post text #{n + 1}",
  #       comments_counter: 3,
  #       likes_counter: 7,
  #       author_id: user.id,
  #     )
    # end
    # visit user_posts_path(user)
  # end

  describe 'Post Index page' do
    before(:each) do
      visit "/users/#{@user.id}/posts" #user_posts_path(@user)
    end
    it 'displays user profile information' do
      # expect(page).to have_css("img[src*='#{@user.photo}']")
      expect(page).to have_content(@user.name)
      expect(page).to have_content("Number of posts: #{@user.post_counter}")
    end

    it 'displays each post with relevant information' do
      @posts = @user.posts

      @posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text[0..49])
        expect(page).to have_content("Comments: #{post.comments_counter}")
        expect(page).to have_content("Likes: #{post.likes_counter}")
        expect(page).to have_link("Read post", href: user_post_path(post))
      end
    end

    it 'displays the first comments on a post' do
      @posts = @user.posts

      @posts.each do |post|
        next unless post.comment_entries.any?

        post.comment_entries.first(2).each do |comment|
          expect(page).to have_content("#{comment.author.name} - #{comment.text}")
        end
      end
    end

    it "Pagination" do
      expect(page).to have_button('Pagination')
    end
  end

end

