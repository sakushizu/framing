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
      redirect_to :new, alert: @message.errors.full_messages.join(', ')
    end
    redirect_to root_path, success: "Successfully create your post."
  end

  def search
    @posts = Post.tagged_with(params[:keyword])
    @tag_name = params[:keyword]
  end

  def edit
  end

  def update
    unless @post.update(post_params)
      redirect_to :edit, alert: @message.errors.full_messages.join(', ')
    end
    redirect_to root_path, success: "Successfully updated your post."
  end

  def destroy
    if @post.user_id == current_user.id
      @post.destroy
    end
    redirect_to root_path, success: "Successfully destroy your post."
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
