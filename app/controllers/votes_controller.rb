class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:like, :accept]
  before_action :set_answer, only: [:like, :accept]

  def like
      if current_user != @answer.user
        Like.create(:user_id => current_user.id, :answer_id => @answer.id)
        @answer.user.update_attribute(:points, @answer.user.points + 5)
      else
        flash.now[:error] = "You can't vote in your own answers!"
      end
      redirect_to question_path(params[:question_id])
  end

  def accept
    @answer.update_attributes(:accepted => true)
    @answer.user.update_attribute(:points, @answer.user.points + 25)
    redirect_to question_path(params[:question_id])
  end

  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end
end
