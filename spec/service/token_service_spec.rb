require 'rails_helper'

RSpec.describe TokenService type: :model do
  it "can get a token" do
    token_service = TokenService.new(username: "Liam", password: "LOGIN")
    token = token_service.get_token

    expect(token).to_not eq(nil)
  end

  it "can decode a token" do
    user = User.create(username: "Liam", password: "LOGIN")
    token_service = TokenService.new(username: "Liam", password: "LOGIN")
    token = token_service.get_token
    user_response = TokenService.find_user(token)

    expect(user_response).to eq(user)
  end
end
