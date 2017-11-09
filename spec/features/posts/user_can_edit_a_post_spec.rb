require 'rails_helper'

RSpec.feature "user can edit a post spec" do
  context "from main feed" do
    it "with valid information" do
      user = User.create(username: "Liamthegreat",
                         password: "LOGIN",
                         first_name: "Greatest",
                         email: "liambarstad@gmail.com",
                         last_name: "Ever",
                         role: 0)
      visit "/"
      click_on "Login"
      fill_in "username", with: user.username
      fill_in "password", with: "LOGIN"
      click_on "Login"

      visit "posts/index"
      new_field = page.find(".new-post-body")
      fill_in new_field, with: "Hello World"
      click_on "Submit"

      expect(page).to have_content("Hello World")
    end

    it "with empty body" do
      user = User.create(username: "Liamthegreat",
                         password: "LOGIN",
                         first_name: "Greatest",
                         email: "liambarstad@gmail.com",
                         last_name: "Ever",
                         role: 0)
      visit "/"
      click_on "Login"
      fill_in "username", with: user.username
      fill_in "password", with: "LOGIN"
      click_on "Login"

      visit "/users/show#{user.id}"
      click_on "Submit"

      expect(page).to_not have_content("Hello World")
      expect(page).to have_content("Post field can't be blank")
    end
  end

  context "from profile page" do
    it "with valid information" do
      user = User.create(username: "Liamthegreat",
                         password: "LOGIN",
                         first_name: "Greatest",
                         email: "liambarstad@gmail.com",
                         last_name: "Ever",
                         role: 0)
      visit "/"
      click_on "Login"
      fill_in "username", with: user.username
      fill_in "password", with: "LOGIN"
      click_on "Login"

      visit "/users/show#{user.id}"
      new_field = page.find(".new-post-body")
      fill_in new_field, with: "Hello World"
      click_on "Submit"

      expect(page).to have_content("Hello World")
    end

    it "with empty body" do
      user = User.create(username: "Liamthegreat",
                         password: "LOGIN",
                         first_name: "Greatest",
                         email: "liambarstad@gmail.com",
                         last_name: "Ever",
                         role: 0)
      visit "/"
      click_on "Login"
      fill_in "username", with: user.username
      fill_in "password", with: "LOGIN"
      click_on "Login"

      visit "/users/show#{user.id}"
      click_on "Submit"

      expect(page).to_not have_content("Hello World")
      expect(page).to have_content("Post field can't be blank")
    end
  end
end
