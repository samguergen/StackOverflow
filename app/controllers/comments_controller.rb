class CommentsController < ApplicationController

  def index
    @comments = Comments.all
  end

  def new
    @comment = Comment.new
  end

  def create
    new_comment = Comment.new(comment_params)
    if new_comment.save!
      flash[:notice] = "Thank You for Commenting!"
      case new_comment.commentable_type
      when "Question"
        redirect_to question_path(new_comment.commentable_id)
      when "Answer"
        answer = Answer.find(new_comment.commentable_id)
        redirect_to question_path(answer.question)
      end
    else
      flash[:notice] = "A problem has occurred. Your comment couldn't be posted."
      redirect_to questions_path
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end
end
