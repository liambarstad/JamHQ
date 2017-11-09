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
      user = User.create(username: "Liam",
                         password: "LOGIN",
                         first_name: "Liam",
                         email: "liambarstad@gmail.com3")
      post = Post.new(body: "oh what a feeling")
      token_service = TokenService.new(email: "liambarstad@gmail.com3", password: "LOGIN")
      token = token_service.get_token

      post "/api/v1/posts", headers: { token: token, body: "" }

      saved_post = Post.find_by(body: post.body)

      expect(response.status).to eq(204)
      expect(saved_post).to eq(nil)
    end
  end

  context "can update a post" do
    it "with valid info" do
      user = User.create(username: "Liam",
                         password: "LOGIN",
                         first_name: "Liam",
                         email: "liambarstad@gmail.com4")
      post = user.posts.create(body: "oh what a feeling")
      token_service = TokenService.new(email: "liambarstad@gmail.com4", password: "LOGIN")
      token = token_service.get_token

      put "/api/v1/posts/#{post.id}", headers: { token: token, body: "more of a feeling" }
      result = JSON.parse(response.body)

      expect(result['body']).to eq("more of a feeling")
    end

    it "with empty body" do
      user = User.create(username: "Liam",
                         password: "LOGIN",
                         first_name: "Liam",
                         email: "liambarstad@gmail.com5")
      post = user.posts.create(body: "oh what a feeling")
      token_service = TokenService.new(email: "liambarstad@gmail.com5", password: "LOGIN")
      token = token_service.get_token

      put "/api/v1/posts/#{post.id}", headers: { token: token, body: "" }

      expect(response.status).to eq(204)
    end
  end

  context "can destroy a post" do
    it "with valid information" do
      user = User.create(username: "Liam",
                         password: "LOGIN",
                         first_name: "Liam",
                         email: "liambarstad@gmail.com6")
      post = user.posts.create(body: "oh what a feeling")
      token_service = TokenService.new(email: "liambarstad@gmail.com6", password: "LOGIN")
      token = token_service.get_token

      delete "/api/v1/posts/#{post.id}", headers: { token: token }
      new_post = Post.find_by(body: "oh what a feeling")

      expect(new_post).to eq(nil)
    end
  end
end
