class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    if @comment.parent_comment_id.nil?
      redirect_to post_url(@comment.post_id)
    else
      redirect_to comment_url(@comment.parent_comment_id)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :post_id, :parent_comment_id)
  end

end
