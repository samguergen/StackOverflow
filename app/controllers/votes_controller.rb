class VotesController < ApplicationController



  def new
    @vote = Vote.new
  end


  def create
    p "Over Here!!!"
    p "#{params[:test]}"
    @question = params[:question_id]

    if params[:like] == "yes"
    @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:question_id], votable_type: "Question" , point: 1)

    elsif params[:like] == "no"
    @vote = Vote.create!(user_id: session[:user_id], votable_id: params[:question_id], votable_type: "Question", point: -1)
    # @question = @vote.question
  #   if @vote.save!
  #     redirect_to question_path(@question)
  #   else
  #     flash[:notice] = "You can't vote!"
  #     redirect_to question_path(@question)
  #   end
    end
    redirect_to question_path(@question)
  end

end