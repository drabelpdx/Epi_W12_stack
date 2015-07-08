class AnswersController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      current_user.answers.push(@answer)
      flash[:notice] = "Your answer has been posted."
      redirect_to user_question_path(current_user.id, @question)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

end
