class CommentsController < ApplicationController

  def create
    Comment.create(user_id: current_user.id, post_id: params[:post_id], text: params[:text])
    redirect_to :back
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    comment.destroy
    @post = Post.find(params[:post_id])
  end
end
