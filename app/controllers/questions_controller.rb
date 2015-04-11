class QuestionsController < ApplicationController
  
  def index
  	@quesions = Question.all
  end


 private
  def question_params
    params.require(:question).permit(:title, :content, :answer_id, :user_id)
  end


end