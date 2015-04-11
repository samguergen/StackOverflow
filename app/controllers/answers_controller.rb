class AnswersController < ApplicationController
  
  def edit
    @answer = Article.find(params[:id])
  end

  def update
     @answer = Answer.find(params[:id])

     @answer.update(answer_params)
     if @answer.save
      redirect_to @answer
     else
      redirect_to '/edit'
     end
  end


 private
  def answer_params
    params.require(:answer).permit(:question_id, :content, :user_id)
  end


end