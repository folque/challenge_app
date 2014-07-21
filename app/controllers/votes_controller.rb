class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:like, :accept]
  before_action :set_answer, only: [:like, :accept]
  before_action :set_user, only: [:like, :accept]

  def like
      @answer.create_like(@user)
      @user.voted_answer
      redirect_to question_path(params[:question_id])
  end

  def accept
    @answer.accept
    @user.accepted_answer
    redirect_to question_path(params[:question_id])
  end

  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_user
      @user = @answer.user
    end

end
