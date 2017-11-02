require 'rails_helper'

RSpec.feature "user can create a new account" do
  scenario "from main page" do
    user = User.new(username: "Liamthegreat",
                    password: "LOGIN",
                    first_name: "Greatest",
                    last_name: "Ever",
                    role: 0)

    visit "/"
    click_on "Register"
    fill_in "username", with: user.username
    fill_in "password", with: "LOGIN"
    click_on "Create New Account"

    expect(current_path).to eq("/")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end

  scenario "from login page" do
    user = User.new(username: "Liamthegreat",
                    password: "LOGIN",
                    first_name: "Greatest",
                    last_name: "Ever",
                    role: 0)

    visit "/"
    click_on "Login"
    click_on "Create New Account"
    fill_in "username", with: user.username
    fill_in "password", with: "LOGIN"
    click_on "Create New Account"

    expect(current_path).to eq("/")
    expect(page).to_not have_content("Login")
    expect(page).to have_content("Logout")
  end
end
