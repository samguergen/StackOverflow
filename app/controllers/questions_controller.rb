class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @new_question = Question.new(question_params)
    if @new_question.save!
      redirect_to question_path(@new_question)
    else
      flash[:notice] = "A problem has occurred. Your question couldn't be posted."
      redirect_to questions_path
    end
  end

  def show
    @question = Question.find(params[:id])
    @question_vote = @question.votes

  end

  def destroy
    @question = Question.find(params[:id])
    if session[:user_id] == @question.creator_id
      @question.destroy!
      redirect_to questions_path
    else
      flash[:notice] = "You can only delete your own questions!"
      redirect_to questions_path
    end
  end

  private
  def question_params
    params.require(:question).permit(:title, :content).merge(creator_id:session[:user_id])
  end
end