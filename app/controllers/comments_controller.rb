class CommentsController < ApplicationController

  def new
    @parent = params[:question]
  end

  def create
    @comment = Comment.new(question_params)
    if @comment.save
      if @comment.commentable.class.to_s == 'Question'
        redirect_to @comment.commentable
      else
        redirect_to @comment.commentable.question
      end
    else
      500
    end
  end

  private

  def question_params
    params.require(:comments).permit(:content, :commentable_type, :commentable_id, :user_id)
  end
end