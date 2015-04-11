class AnswersController < ApplicationController
  def create
    answer = Answer.new(answer_params)
    answer.user_id = session[:user_id]
    answer.save

    redirect_to answer.question
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end