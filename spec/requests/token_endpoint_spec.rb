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

    end
  end
end
