require 'rails_helper'

RSpec.feature "user can log in" do
  scenario "with built in credentials" do
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

    expect(current_path).to eq("/")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end

  xscenario "with facebook" do
    user = User.create(username: "Liamthegreat",
                       password: "LOGIN",
                       first_name: "Greatest",
                       last_name: "Ever",
                       role: 0)
    visit "/"
    click_on "Login"
    click_on "Login With Facebook"
    fill_in "username", with: user.username
    fill_in "password", with: "LOGIN"
    click_on "Login"

    expect(current_path).to eq("/")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end
end
