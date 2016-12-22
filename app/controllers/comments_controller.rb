class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.html do
          redirect_to post_path(@post)
        end
        format.json do
          render json: @comment
        end
      end
    else
      respond_to do |format|
        format.html do
          flash.now[:alert] = @comment.errors.full_messages.join(', ')
        end
        format.json do
          render json: @comment.errors, status: :unprocessable_entity
        end
      end
    end
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
