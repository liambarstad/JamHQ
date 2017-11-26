require 'rails_helper'

RSpec.feature "token service" do
  it "can get a token" do
    token = TokenService.get_token(email: "Liam", password: "LOGIN")

    expect(token).to_not eq(nil)
  end

  it "can decode a token" do
    user = User.create(username: "Liam",
                       password: "LOGIN",
                       first_name: "Liam",
                       email: "liambarstad@gmail.com1")
    token = TokenService.get_token(email: "liambarstad@gmail.com1", password: "LOGIN")
    user_hash = TokenService.decode_token(token)

    expect(user_hash["email"]).to eq(user.email)
    expect(user_hash["password"]).to eq("LOGIN")
  end

end
