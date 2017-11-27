require 'rails_helper'

RSpec.describe "token endpoints" do
  context "can get a token" do
    it "with valid user info" do
      user = create(:user, password: 'LOGIN')

      get "/api/v1/token", headers: { email: user.email, password: 'LOGIN' }
      result = JSON.parse(response.body)
      info = TokenService.decode_token(result["token"])

      expect(response).to be_success
      expect(result).to be_truthy
    end

    it "with invalid info" do
      user = create(:user, password: 'LOGIN')

      get "/api/v1/token", headers: { email: "wrong_email", password: "wronger_password" }
      result = JSON.parse(response.body)

      expect(result).to eq(nil)
    end

    it "with invalid password" do  
      user = create(:user, password: 'LOGIN')

      get "/api/v1/token", headers: { email: user.email, password: "wronger_password" }
      result = JSON.parse(response.body)

      expect(result).to eq(nil)
    end
  end
end
