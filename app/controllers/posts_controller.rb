class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    unless @post.save
      render :new and return
    end
    redirect_to action: :index
  end

  def search
    @posts = Post.tagged_with(params[:keyword])
    @tag_name = params[:keyword]
  end

  def edit
  end

  def update
    unless @post.user_id == current_user.id
      redirect_to :show and return
    end

    unless @post.update(post_params)
      render :edit and return
    end

    redirect_to action: :show
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
    end
    redirect_to action: :index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post)
      .permit(
        :title,
        :description,
        :image,
        :label_list
      ).merge(
        user_id: current_user.id
      )
  end
end
