class CommentsController < ApplicationController

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.save
    redirect_to users_path, notice: "Comment added successfully"
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end

