class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with(
    name: ENV.fetch("USERNAME"),
    password: ENV.fetch("PASSWORD"),
    except: [:index, :show],
  )

  # GET /posts
  def index
    @posts = Post.order(created_at: :desc).all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:title, :tags, :body)
  end
end
