class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  # :recoverable, :rememberable and :trackable
  devise :database_authenticatable, :registerable, :validatable

  has_many :questions
  has_many :answers
  has_many :likes
 # after_initialize :init

  def to_s
    email
  end

  #def init
  #  self.points = 100           #will set the default value only if it's nil
  #end
end
