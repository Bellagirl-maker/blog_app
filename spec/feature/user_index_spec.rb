require 'rails_helper'

RSpec.describe 'User', type: :feature do
  let!(:users) do
    [
      User.create(name: 'Sarkodie', photo: '/path/to/photo1.jpg', post_counter: 10),
      User.create(name: 'Ponobiom', photo: '/path/to/photo2.jpg', post_counter: 5),
      User.create(name: 'Stonebwoy', photo: '/path/to/photo3.jpg', post_counter: 3)
    ]
  end

  before do
    visit root_path
  end

  it 'displays the username of all users' do
    users.each do |user|
      expect(page).to have_content(user.name)
      expect(page).to have_css("img[src*='#{user.photo}']")
      expect(page).to have_content(user.posts.count)
    end
  end

  it 'redirects current user to show page' do
    users.each do |user|
      find(:xpath, "//a[@class='home-card' and contains(@href, 'users/#{user.id}')]").click
      expect(page).to have_current_path(user_path(user))
      visit root_path
    end
  end
end
