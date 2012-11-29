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
  
  def save_ice_time
    jsonArr = request.body.read
    objArr = JSON.parse(jsonArr)
    resses = []
    
    objArr.each do |o|
      resses.push(Reservation.new(starts_at: o["starts_at"], date: o["date"], activity: o["activity"], team_id: o["team_id"]))
    end
    
    res = Reservation.find_by_date_and_team_id_and_starts_at(resses.first.date, resses.first.team_id, resses.first.starts_at)
    team = Team.find(resses.first.team_id)
    
    if res
      render :text => res.activity
    else
      render :text => "Not found"
    end
    
  end
end