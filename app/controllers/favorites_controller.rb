class FavoritesController < ApplicationController

  def create
    Favorite.create(user_id: current_user.id, post_id: params[:post_id])
    @post = Post.find(params[:post_id])
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    favorite.destroy
    @post = Post.find(params[:post_id])
  end
end
