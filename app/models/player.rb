class Player < ActiveRecord::Base
  attr_accessible :f_name, :l_name, :number, :position, :team_id
  
  belongs_to :team
end
