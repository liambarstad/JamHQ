class Api::V1::PostsController < Api::V1::ApiController
  before_action :authenticate_user
  before_action :find_body, except: [:destroy]

  def create
    new_post = @user.posts.new(body: @body)
    if new_post.save
      render json: new_post, status: :created
    end
  end

  def update
    begin
      post = @user.posts.find(params['id'])
      if post.update(body: @body)
        render json: post
      end
    rescue
      render json: nil
    end
  end

  def destroy
    begin
      post = @user.posts.find(params['id'])
      if post.destroy
        render json: nil
      end
    rescue
      render json: { error: "not found" }
    end
  end

end
