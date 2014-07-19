class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :correct_answer, :class_name => "Answer"

  validates :title, presence: true
end
