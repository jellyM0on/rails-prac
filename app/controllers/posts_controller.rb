class PostsController < ApplicationController
  before_action :check_auth, only: [ :create, :update, :destroy ]
  before_action :validate_params, only: [ :create ]
  before_action :validate_params_update, only: [ :update ]

  def validate_params
      @validated_params = params.require(:post).permit(:title, :content, :author_name)
  end

  def validate_params_update
    @validated_params_update = params.require(:post).permit(:title, :content)
  end

  def check_auth
    if request.headers["Authorization"] != "1"
      render json: { message: "Unauthorized" }, status: :unauthorized
    end
  end

  def pagination_meta(posts) {
      current_page: posts.current_page,
      next_page: posts.next_page,
      total_pages: posts.total_pages,
      total_count: posts.total_count
    }
  end

  def index
    @q = Post.ransack(params[:q])
    posts = @q.result.page(params[:page] ? params[:page].to_i : 1).per(params[:limit] || 25)
    render json: { posts: posts, pages_info: pagination_meta(posts) }

  rescue StandardError
    render json: { message: "Bad Request" },  status: :bad_request
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(@validated_params)
    if post.save
      render json: post, status: :created
    else
      render json: { errors: post.errors }, status: :bad_request
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(@validated_params_update)
      render json: post, status: :ok
    else
      render json: { errors: post.errors }, status: :bad_request
    end
  end


  def destroy
    post = Post.find(params[:id])
    if post.destroy
      render json: post, status: :ok
    else
      render json: { errors: post.errors }, status: :bad_request
    end
  end

  private :validate_params, :validate_params_update, :pagination_meta, :check_auth
end
