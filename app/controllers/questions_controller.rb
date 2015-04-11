class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    @new_question = Question.new(question_params)
    if @new_question.save!

  end

  def show
    @question = Question.find(params[:id])
  end

  def index
    @questions = Question.all
  end

  def destroy
    @question = Question.find(params[:id])
    if session[:user_id] == @question.user_id
      @question.destroy!
      redirect_to questions_path
    else
      flash[:notice] = "You can only delete your own questions!"
      redirect_to questions_path
    end
  end

end