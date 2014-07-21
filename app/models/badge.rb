class Badge < ActiveRecord::Base
  has_many :rewardings
  has_many :users, :through => :rewardings
end