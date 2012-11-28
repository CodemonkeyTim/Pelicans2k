class Reservation < ActiveRecord::Base
  attr_accessible :activity, :created_by, :starts_at, :team_id, :date
  
  belongs_to :team
end
