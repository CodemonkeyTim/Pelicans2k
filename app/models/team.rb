class Team < ActiveRecord::Base
  attr_accessible :code, :name
  
  has_many :players
  has_many :reservations
  has_many :staff_members
end
