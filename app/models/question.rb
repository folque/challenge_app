class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :correct_answer, :class_name => "Answer"

  validates :title, presence: true

  def has_accepted_answer
    self.answers.each do |answer|
      if answer.accepted?
        return true
      end
    end
    return false
  end

end
