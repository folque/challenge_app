class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:like, :accept]
  before_action :set_answer, only: [:like, :accept]

  def like
      Like.create(:user_id => current_user.id, :answer_id => @answer.id)
      redirect_to question_path(params[:question_id])
  end

  def accept
    @answer.update_attributes(:accepted => true)
    redirect_to question_path(params[:question_id])
  end

  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end
end
