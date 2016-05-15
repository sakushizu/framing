class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(create_params)
  end

  def search
    @posts = Post.tagged_with(params[:keyword])
    @tag_name = params[:keyword]
  end


private
  def create_params
    params.require(:post).permit(:title, :description, :image, :label_list).merge(user_id: current_user.id)
  end

end
