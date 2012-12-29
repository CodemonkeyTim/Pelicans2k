# encoding: UTF-8

class AjaxController < ApplicationController
  before_filter :authenticate_user!
  
  def get_cal_for_team
    today = DateTime.now + (params[:diff].to_i * 7)
    
    mon = today.at_beginning_of_week
    sun = today.at_end_of_week
    
    resses = nil
    
    if params[:ice_time]
      resses = Reservation.where(:date => (mon)..(sun), :activity => "Jääaika", :team_id => params[:team_id])
    else
      resses = Reservation.where(:date => (mon)..(sun), :team_id => params[:team_id])
    end
    
    render :json => resses
  end
  
  def get_staff_members
    render :json => Team.find(params[:id]).staff_members.order("role DESC")
  end
  
  def get_cal_for_all
    today = DateTime.now + (params[:diff].to_i * 7)
    
    mon = today.at_beginning_of_week
    sun = today.at_end_of_week
    
    resses = Reservation.where(:date => (mon)..(sun), :activity => "Jääaika")
    
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
    
    all_new = true;
    
    resses.each do |res|
      if res.activity == "Jääaika"
        existing_res = Reservation.find_by_date_and_starts_at(res.date, res.starts_at)
      end
      
      if existing_res
        all_new = false;
        break;
      else
        res.save
      end
    end
    
    if all_new
      render :text => "success"
    else
      render :text => "error"
    end    
  end
  
  def create_news
    jsonObj = request.body.read
    
    po_news = JSON.parse(jsonObj)
    
    new_news = News.new()
    
    new_news.title = po_news["title"]
    new_news.body = po_news["body"]
    new_news.published_at = DateTime.now
    new_news.publisher_id = current_user.id
    
    if new_news.save
      render :json => new_news
    else
      render :text => "error"
    end
  end
  
  def update_news
    jsonObj = request.body.read
    
    po_news = JSON.parse(jsonObj)
    
    old_po_news = News.find(po_news["id"])
    
    old_po_news.title = po_news["title"]
    old_po_news.body = po_news["body"]
    old_po_news.edited_at = DateTime.now
    old_po_news.edited_by_id = current_user.id
    
    if old_po_news.save
      session[:news_update_success] = true
      render :text => "success"
    else
      render :text => "error"
    end
  end
  
  def update_staff_member
    jsonObj = request.body.read
    
    staff_member = JSON.parse(jsonObj)
    
    old_staff_member = StaffMember.find(staff_member["id"])
    
    old_staff_member.role = staff_member["role"]
    old_staff_member.f_name = staff_member["f_name"]
    old_staff_member.l_name = staff_member["l_name"]
    old_staff_member.email = staff_member["email"]
    old_staff_member.phone = staff_member["phone"]
     
    if old_staff_member.save
      session[:staff_member_update_success] = true
      render :text => "success"
    else
      render :text => "error" 
    end
  end
  
  def create_staff_member
    jsonObj = request.body.read
    
    staff_member_json = JSON.parse(jsonObj)
    
    staff_member = StaffMember.new()
    
    staff_member.role = staff_member_json["role"]
    staff_member.f_name = staff_member_json["f_name"]
    staff_member.l_name = staff_member_json["l_name"]
    staff_member.email = staff_member_json["email"]
    staff_member.phone = staff_member_json["phone"]
    staff_member.team_id = staff_member_json["team_id"]
     
    if staff_member.save
      render :json => staff_member
    else
      render :text => "error" 
    end
  end
  
  def delete_staff_member
    staff_member = StaffMember.find(params[:id])
    
    if staff_member.delete
      render :text => "success"
    else
      render :text => "error"
    end
  end
  
  def update_team
    jsonObj = request.body.read
    
    team = JSON.parse(jsonObj)
    
    old_team = Team.find(team["id"])
    
    old_team.name = team["name"]
    old_team.code = team["code"]
    
    if old_team.save
      session[:team_update_success] = true
      render :text => "success"
    else
      render :text => "error" 
    end
  end
  
  def delete_news
    po_news = News.find(params[:id])
    
    if po_news.delete
      render :text => "success"
    else
      render :text => "error"  
    end
  end
  
  def delete_team
    team = Team.find(params[:id])
    
    if team.delete
      render :text => "success"
    else
      render :text => "error"
    end
  end
  
  def create_team
    jsonObj = request.body.read
    
    team_json = JSON.parse(jsonObj)
    
    team = Team.new(name: team_json["name"], code: team_json["code"])
    
    if team.save
      render :json => team
    else
      render :text => "error"
    end
  end
  
  
  def get_players
    render :json => Team.find(params[:id]).players
  end
  
  def update_player
    jsonObj = request.body.read
    
    player_json = JSON.parse(jsonObj)
    
    player = Player.find(player_json["id"])
    
    player.number = player_json["number"]
    player.f_name = player_json["f_name"]
    player.l_name = player_json["l_name"]
     
    if player.save
      session[:player_update_success] = true
      render :text => "success"
    else
      render :text => "error" 
    end
  end
  
  def create_player
    jsonObj = request.body.read
    
    player_json = JSON.parse(jsonObj)
    
    player = Player.new()
    
    player.number = player_json["number"]
    player.f_name = player_json["f_name"]
    player.l_name = player_json["l_name"]
    player.position = player_json["position"]
    player.team_id = player_json["team_id"]
     
    if player.save
      render :json => player
    else
      render :text => "error" 
    end
  end
  
  def delete_player
    player = Player.find(params[:id])
    
    if player.delete
      render :text => "success"
    else
      render :text => "error"
    end
  end
  
  def create_user
    jsonObj = request.body.read
    
    user_json = JSON.parse(jsonObj)
    
    user = User.new
    
    user.email = user_json["email"]
    user.role = user_json["role"]
    user.f_name = user_json["f_name"]
    user.l_name = user_json["l_name"]
    user.password = user_json["pw"]
    user.password_confirmation = user_json["pw"]
    user.team_id = user_json["team_id"]
    
    if user.save
      render :json => user
    else
      render :text => "error" 
    end
  end
  
  def update_user
    jsonObj = request.body.read
    
    user_json = JSON.parse(jsonObj)
    
    user = User.find(user_json["id"])
    
    if user.role == "admin"
      render :text => "forbidden"
      return 
    end
    
    user.email = user_json["email"]
    user.role = user_json["role"]
    user.f_name = user_json["f_name"]
    user.l_name = user_json["l_name"]
    user.team_id = user_json["team_id"]
    
    if user.save
      session[:user_update_success] = true
      render :text => "success"
    else
      render :text => "error" 
    end
  end
  
  def delete_user
    user = User.find(params[:id])
    
    if user.role == "admin"
      render :text => "forbidden"
      return
    end
    
    if user.delete
      render :text => "success"
    else
      render :text => "error"
    end
  end
  
  def save_new_password
    jsonObj = request.body.read
    
    user_json = JSON.parse(jsonObj)
    
    user = User.find(user_json["id"])
    
    user.password = user_json["pw"]
    user.password_confirmation = user_json["pw"]
    
    if user.save
      session[:new_password_success] = true
      render :text => "success"
    else
      render :text => "error"
    end
    
  end
  
  def get_team_name 
    team = Team.find(params[:id])
    
    if team
      render :json => team
    else
      render :text => "not found"
    end
  end
end