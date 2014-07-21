class Badge < ActiveRecord::Base
  has_many :rewardings
  has_many :users, :through => :rewardings

  SUPERSTAR = 'Superstar'

  def self.superstar
    self.find_by(:name => SUPERSTAR)
  end

end