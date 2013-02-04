class BaseReservation < ActiveRecord::Base
  attr_accessible :activity, :created_by, :day, :starts_at, :team_id
end
