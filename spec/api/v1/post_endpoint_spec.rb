require 'rails_helper'

RSpec.describe "post endpoints" do
  context "can create a post" do
    it "with valid info" do
      user = User.create(username: "Liam",
                         password: "LOGIN",
                         first_name: "Liam",
                         email: "liambarstad@gmail.com3")
      post = Post.new(body: "oh what a feeling")
      token_service = TokenService.new(email: "liambarstad@gmail.com3", password: "LOGIN")
      token = token_service.get_token

      post "/api/v1/posts", headers: { token: token, body: post.body }

      saved_post = Post.find_by(body: post.body)
      result = JSON.parse(response.body)

      expect(saved_post).to_not eq(nil)
      expect(saved_post.user).to eq(user)
      expect(result['body']).to eq(post.body)
    end

    it "with empty body" do

    end

    it "with invalid info" do

    end
  end

  context "can update a post" do
    it "with valid info" do

    end

    it "with empty body" do

    end

    it "with invalid info" do

    end
  end

  context "can destroy a post" do

  end
end
