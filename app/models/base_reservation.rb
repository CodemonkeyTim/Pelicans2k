class BaseReservation < ActiveRecord::Base
  attr_accessible :activity_type, :created_by, :day, :starts_at, :team_id
end
