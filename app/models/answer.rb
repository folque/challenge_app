class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes

  validates :contents, presence: true

  def create_like(user)
    if current_user != user
      Like.create(:user_id => user, :answer_id => self.id)
    end
  end

  def accept
    self.update_attributes(:accepted => true)
  end

end
