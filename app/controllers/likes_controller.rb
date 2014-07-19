class LikesController < ApplicationController
  def create
      @answer = Answer.find(params[:answer_id])
      Like.create(:user_id => current_user.id, :answer_id => @answer.id)
      redirect_to question_path(params[:question_id])
  end
end
