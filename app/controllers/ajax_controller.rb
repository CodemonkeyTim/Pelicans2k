class AjaxController < ApplicationController
  def get_cal_for_team
    team = Team.find(params[:team_id])
    render :json => team.reservations
  end
  
  def get_cal_for_all
    resses = Reservation.all
    resses_json = []
    
    resses.each do |res|
      resses_json.push({activity: res.activity, starts_at: res.starts_at, date: res.date, team_name: Team.find(res.team_id).name})
    end
    
    render :json => resses_json
  end
end

class Res
  attr_accessor :activity, :starts_at, :team_id, :date, :team
  
  def initialize(activity, starts_at, date, team_name)
    @activity = activity
    @starts_at = starts_at
    @date = date
    @team_name = team_name     
  end
end