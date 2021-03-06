class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question
  before_action :set_answer, only: [:like, :accept]
  before_action :set_user, only: [:like, :accept]

  def create
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.question = @question

    if @answer.save
      redirect_to question_path(@question), notice: "Answer was successfully created."
    else
      redirect_to question_path(@question), alert: "There was an error when adding answer."
    end
  end

  def like
    if @answer.create_like(current_user)
      @user.voted_answer
      redirect_to question_path(params[:question_id])
    else
      redirect_to question_path(params[:question_id]), alert: "You can't vote twice on the same answer"
    end
  end

  def accept
    @answer.accept
    @user.accepted_answer
    redirect_to question_path(params[:question_id]), notice: "Answer was accepted"
  end

  private

    def set_question
      @question = Question.find(params[:question_id])
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_user
      @user = @answer.user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:contents)
    end
end
