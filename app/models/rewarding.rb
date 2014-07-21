class Rewarding < ActiveRecord::Base
  belongs_to :badge
  belongs_to :user

  SUPERSTAR_POINTS = 100

  def self.create_superstar_badge(user)
    superstar = Badge.superstar
    self.create(:user_id => user.id, :badge_id => superstar.id)
  end

end
