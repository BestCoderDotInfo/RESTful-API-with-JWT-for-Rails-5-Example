class Api::V1::PostsController < ApiController
  include Pagination
  before_action :set_post, only: [:update, :destroy]

  def index
    @posts = paginate(Post.all, params[:page], 10)
    json_response(@posts)
  end

  def create
    post = @current_user.posts.create(post_params)
    if post.save
      json_response(post)
    else
      json_response({message: post.errors.full_messages})
    end
  end

  def update
    if @post && @post.update(post_params)
      json_response(@post)
    else
      json_response({message: @post.errors.full_messages})
    end
  end

  def destroy
    @post.destroy
    head 204
  end

  private
    def post_params
      params.require(:post).permit(:name, :body)
    end

    def set_post
      @post = Post.find(params[:id])
    end
end
