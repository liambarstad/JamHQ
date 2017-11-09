require 'rails_helper'

RSpec.feature "user can make a post" do
  scenario "from main feed" do
    user = User.create(username: "Liamthegreat",
                       password: "LOGIN",
                       first_name: "Greatest",
                       last_name: "Ever",
                       role: 0)
    visit "/"
    click_on "Login"
    fill_in "username", with: user.username
    fill_in "password", with: "LOGIN"
    click_on "Login"

    visit users_path
    fill_in "new_post", with: "Lorem"
    click_on "Post"

    expect(page).to have_content("Lorem")

    visit user_path(user)

    expect(page).to have_content("Lorem")
  end

  scenario "from profile page" do
    user = User.create(username: "Liamthegreat",
                       password: "LOGIN",
                       first_name: "Greatest",
                       last_name: "Ever",
                       role: 0)
    visit "/"
    click_on "Login"
    fill_in "username", with: user.username
    fill_in "password", with: "LOGIN"
    click_on "Login"

    visit user_path(user)
    fill_in "new_post", with: "Lorem"
    click_on "Post"

    expect(page).to have_content("Lorem")

    visit users_path

    expect(page).to have_content("Lorem")
  end

  xscenario "but not on a different profile" do
    user1 = User.create(username: "Liamthegreat",
                       password: "LOGIN",
                       first_name: "Greatest",
                       last_name: "Ever",
                       role: 0)
    user2 = User.create(username: "Billthelesser",
                        password: "LOGIN2",
                        first_name: "NotThe",
                        last_name: "Greatest",
                        role: 0)
    visit "/"
    click_on "Login"
    fill_in "username", with: user2.username
    fill_in "password", with: "LOGIN2"
    click_on "Login"

    visit user_path(user1)

    expect(page).to_not have_css(".post_field")
  end
end
