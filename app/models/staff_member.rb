class StaffMember < ActiveRecord::Base
  attr_accessible :email, :f_name, :l_name, :phone, :role, :team_id
  
  belongs_to :team
end
