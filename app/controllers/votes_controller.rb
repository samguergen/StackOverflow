class VotesController < ApplicationController



  def new
    @vote = Vote.new
  end


  def create
    p "Over Here!!!"
    p "#{params[:test]}"
    @question = params[:question_id]
    @answer = params[:answer_id]

    if @question    
      if params[:like] == "yes"
        @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:question_id], votable_type: "Question", point: 1)
      elsif params[:like] == "no"
        @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:question_id], votable_type: "Question", point: -1)
      end
      redirect_to question_path(@question)
    elsif @answer
      if params[:like] == "yes"
        @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:answer_id], votable_type: "Answer", point: 1)
      elsif params[:like] == "no"
        @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:answer_id], votable_type: "Answer", point: -1)
      end
      the_answer = Answer.find(@answer)
      redirect_to question_path(the_answer.question)
    end
  end

  #   if params[:like] == "yes"
  #   @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:question_id], votable_type: "Question" , point: 1)

  #   elsif params[:like] == "no"
  #   @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:question_id], votable_type: "Question", point: -1)
  #   end
  #   redirect_to question_path(@question)
  # end

end