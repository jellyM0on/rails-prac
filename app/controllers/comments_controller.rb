class CommentsController < ApplicationController
  before_action :find_post
  before_action :check_auth, only: [ :create, :destroy ]
  before_action :validate_params, only: [ :create ]

  def find_post
    @post = Post.find(params[:post_id])
  end

  def validate_params
    @validated_params = params.require(:comment).permit(:content, :commenter_name)
  end

  def check_auth
    if request.headers["Authorization"] != "1"
      render json: { message: "Unauthorized" }, status: :unauthorized
    end
  end

  def index
    comments = @post.comments
    render json: comments
  end

  def create
    comment = @post.comments.new(@validated_params)
    if comment.save
      render json: comment, status: :created
    else
      render json: { errors: comment.errors }, status: :bad_request
    end
  end

  def destroy
    comment = @post.comments.find(params[:id])
    if comment.destroy
      render json: comment, status: :ok
    else
      render json: { errors: comment.errors }, status: :bad_request
    end
  end

  private :validate_params, :check_auth
end
