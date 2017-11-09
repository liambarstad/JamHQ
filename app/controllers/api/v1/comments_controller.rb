class Api::V1::CommentsController < Api::V1::ApiController
  before_action :authenticate_user, :find_post
  before_action :find_body, except: [:destroy]

  def create
    new_comment = @post.comments.new(@body)
    if new_comment.save
      render json: new_comment, status: :created
    else
      render status: :bad_request
    end
  end

  def update
    begin
      comment = @post.comments.find(request.headers['comment-id'])
      if comment.update(body: @body)
        render json: comment
      else
        render status: :bad_request
      end
    rescue
      render status: :not_found
    end
  end

  def destroy
    begin
      comment = @post.comments.find(request.headers['comment-id'])
      if comment.update(body: @body)
        render status: :ok
      else
        render status: :bad_request
      end
    rescue
      render status: :not_found
    end
  end

  private

  def find_post
    @post = @user.posts.find(request.headers['post-id'])
  end

end
