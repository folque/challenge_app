class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes

  validates :contents, presence: true

  def create_like(user)
    if self.user != user
      unless Like.create(:user_id => user, :answer_id => self.id)
        false
      end
    end
  end

  def accept
    self.question.correct_answer = self
    self.update_attributes(:accepted => true)
  end

end
