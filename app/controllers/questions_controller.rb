class QuestionsController < ApplicationController
  
  def index
    @questions = Question.all
  end
  
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(answer_params)
    @question.user_id = session[:user_id]
    @question.save

    redirect_to @question
  end

  def show
    @question = Question.find(params[:id])
  end


  # def question_params
  #   params.require(:question).permit(:user_id, :title, :user_id :content, :user_id)
  # end
end