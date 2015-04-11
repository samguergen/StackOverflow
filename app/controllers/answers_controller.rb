class AnswersController < ApplicationController
  def create
    answer = Answer.new(answer_params)

    redirect_to answer.question
  end

  private
  def answer_params
    params.require(:answer).permit(:content, :question_id)
  end
end