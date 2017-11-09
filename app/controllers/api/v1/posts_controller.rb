class Api::V1::PostsController < Api::V1::ApiController
  before_action :authenticate_user
  before_action :find_body, except: [:destroy]

  def create
    new_post = @user.posts.new(body: @body)
    if new_post.save
      render json: new_post, status: :created
    else
      render status: :bad_request
    end
  end

  def update
    begin
      post = @user.posts.find(request.headers['id'])
      if post.update(body: @body)
        render json: post
      else
        render status: :bad_request
      end
    rescue
      render status: :not_found
    end
  end

  def destroy
    begin
      post = @user.posts.find(request.headers['id'])
      if post.update(body: @body)
        render status: :ok
      else
        render status: :bad_request
      end
    rescue
      render status: :not_found
    end
  end

  private

  def find_body
    @body = request.headers['body']
  end

end
