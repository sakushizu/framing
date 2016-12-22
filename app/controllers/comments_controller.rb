class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
  end

  def destroy
    comment = Comment.find_by(user_id: current_user.id, post_id: params[:post_id])
    comment.defestroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment)
      .permit(:text)
      .merge(
        user_id: current_user.id
      )
  end
end
