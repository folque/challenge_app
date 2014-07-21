class VotesController < ApplicationController
  before_action :authenticate_user!, only: [:like, :accept]
  before_action :set_answer, only: [:like, :accept]

  def like
      if current_user != @answer.user
        Like.create(:user_id => current_user.id, :answer_id => @answer.id)
        @answer.user.update_attribute(:points, @answer.user.points + 5)
        if has_reached_points(@answer.user, 100)
          create_badge_for_user(@answer.user, 'Superstar')
        end
      else
        flash.now[:error] = "You can't vote in your own answers!"
      end
      redirect_to question_path(params[:question_id])
  end

  def accept
    @answer.update_attributes(:accepted => true)
    @answer.user.update_attribute(:points, @answer.user.points + 25)
    if has_reached_points(@answer.user, 100)
      create_badge_for_user(@answer.user, 'Superstar')
    end
    redirect_to question_path(params[:question_id])
  end

  private

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def has_reached_points(user, points)
      user.points >=  points
    end

    def create_badge_for_user(user, badge_name)
      badges_for_user = user.badges
      if badges_for_user.find_by(:name => badge_name).blank?
        badge = Badge.find_by(:name => badge_name)
        Rewarding.create(:user_id => user.id, :badge_id => badge.id)
      end
    end
end
