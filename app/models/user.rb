class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers
  has_many :likes
  has_many :rewardings
  has_many :badges, :through => :rewardings

  has_attached_file :avatar, styles: {
      thumb: '15x15>',
      small: '100x100>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def to_s
    "#{first_name} #{last_name}"
  end

  def accepted_answer
    self.update_attribute(:points, self.points + 25)
    check_is_superstar
  end

  def voted_answer
    self.update_attribute(:points, self.points + 5)
    check_is_superstar
  end

  def can_vote?(answer)
    if self != answer.user
      true
    else
      false
    end
  end

  def is_creator?(question)
    if self == question.user
      true
    else
      false
    end
  end


  private

    def check_is_superstar
      if has_reached_points?(Rewarding::SUPERSTAR_POINTS)
        create_superstar_badge
      end
    end

    def create_superstar_badge
      badge = Badge.superstar
      unless self.badges.include?(badge)
        Rewarding.create_superstar_badge(self)
      end
    end

    def has_reached_points?(points)
      if self.points >= points
        true
      else
        false
      end
    end
end
