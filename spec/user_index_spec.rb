require 'rails_helper'

RSpec.describe 'User', type: :feature do 
    # subject { User.all }
    let!(:users) do
        [
          User.create(name: "Sarkodie", photo: "/path/to/photo1.jpg", post_counter: 10),
          User.create(name: "Ponobiom", photo: "/path/to/photo2.jpg", post_counter: 5),
          User.create(name: "Stonebwoy", photo: "/path/to/photo3.jpg", post_counter: 3)
        ]
      end
    before do 
        visit root_path
    end
    it "displays the username of all users" do
        users.each do |user|
            expect(page).to have_content(user.name)
            expect(page).to have_css("img[src*='#{user.photo}']")
            expect(page).to have_content(user.posts.count)
            # click_link(user.name, href: { users_id: user.id })
            find("a[href='users/#{user.id}']").click
        end
    end   
end