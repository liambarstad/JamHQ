require 'rails_helper'

RSpec.feature "token service" do
  it "can get a token" do
    token_service = TokenService.new(email: "Liam", password: "LOGIN")
    token = token_service.get_token

    expect(token).to_not eq(nil)
  end

  it "can decode a token" do
    user = User.create(username: "Liam",
                       password: "LOGIN",
                       first_name: "Liam",
                       email: "liambarstad@gmail.com1")
    token_service = TokenService.new(email: "liambarstad@gmail.com1", password: "LOGIN")
    token = token_service.get_token
    user_response = TokenService.find_user(token)

    expect(user_response).to eq(user)
  end

  it "won't decode if random token" do
    user_response = TokenService.find_user("wqedoiujq#@$R#WEQWEDOK#")

    expect(user_response).to be_falsy
  end

  it "won't decode if wrong password" do
    user = User.create(username: "Liam",
                       password: "LOGIN",
                       first_name: "Liam",
                       email: "liambarstad@gmail.com2")
    token_service = TokenService.new(email: "liambarstad@gmail.com2", password: "WRONG")
    token = token_service.get_token
    user_response = TokenService.find_user(token)

    expect(user_response).to eq(nil)
  end
end
