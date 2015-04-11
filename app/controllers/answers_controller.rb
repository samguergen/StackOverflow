class AnswersController < ApplicationController
  
  
  def new
    @answer = Answer.new
  end

  def create
    answer = Answer.new(create_answer_params)
    answer.user_id = session[:user_id]
    answer.save

    redirect_to @answer.question
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
     @answer = Answer.find(params[:id])

     @answer.update(update_answer_params)
     if @answer.save
      redirect_to @answer.question
     else
      redirect_to '/edit'
     end
  end


  private
  def create_answer_params
    params.require(:answer).permit(:content, :question_id)
  end

  def update_answer_params
    params.require(:answer).permit(:question_id, :content, :user_id)
  end
end