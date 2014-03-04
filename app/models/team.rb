class Team < ActiveRecord::Base
  attr_accessible :code, :name, :homepage, :picture_url
  
  has_many :players
  has_many :reservations
  has_many :staff_members
end
