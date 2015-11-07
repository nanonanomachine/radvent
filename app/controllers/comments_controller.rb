class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to item_path(comment_params[:item_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    item_id = @comment.item_id
    @comment.destroy!
    redirect_to item_path(item_id)
  end

  private
  def comment_params
    params.require(:comment).permit(:user_name, :body, :item_id)
  end
end
