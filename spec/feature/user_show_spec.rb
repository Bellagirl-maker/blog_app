require 'rails_helper'

RSpec.describe 'User show page', type: :feature do
  let!(:user) { User.create(name: 'Sarkodie', photo: '/path/to/photo1.jpg', post_counter: 10, bio: 'Very good') }

  before do
    3.times do |n|
      Post.create(
        title: "Post title #{n + 1}",
        text: "Post text #{n + 1}"
      )
    end
    visit user_path(user)
  end

  it 'User profile information' do
    expect(page).to have_css("img[src='#{user.photo}'][alt='User photo']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts.length}")
    expect(page).to have_content(user.bio) # Assuming user.bio is defined
  end

  it 'Displaying first 3 posts' do
    # Fetch the first 3 posts based on their creation order
    first_three_posts = user.posts.order(created_at: :desc).limit(3)

    within '#posts' do
      first_three_posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end
  end
  it 'show see all post button' do
    expect(page).to have_content('See all posts')
  end
  it 'redirects to post show page' do
    posts = user.posts
    posts.each do |post|
      click_link post.title
      expect(current_path).to eq(post_path(post))
      visit user_path(user)
    end
  end
  it 'redirects user to post index page' do
    click_link 'See all posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
