class Team < ActiveRecord::Base
  attr_accessible :code, :name, :homepage
  
  has_many :players
  has_many :reservations
  has_many :staff_members
end
