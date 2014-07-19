class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  has_many :likes
  after_initialize :init

  validates :contents, presence: true

  def init
    self.accepted ||= false           #will set the default value only if it's nil
  end
end
