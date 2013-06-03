class Reservation < ActiveRecord::Base
  attr_accessible :activity_type, :display_activity, :created_by, :starts_at, :team_id, :date
  
  belongs_to :team
end
