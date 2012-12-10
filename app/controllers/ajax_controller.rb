# encoding: UTF-8

class AjaxController < ApplicationController
  def get_cal_for_team
    today = DateTime.now + (params[:diff].to_i * 7)
    
    mon = today.at_beginning_of_week
    sun = today.at_end_of_week
    
    resses = Reservation.where(:date => (mon)..(sun), :activity => "Jääaika", :team_id => params[:team_id])
    
    render :json => resses
  end
  
  def get_staff_members
    render :json => Team.find(params[:id]).staff_members
  end
  
  def get_players
    render :json => Team.find(params[:id]).players
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
      existing_res = Reservation.find_by_date_and_starts_at_and_team_id(res.date, res.starts_at, res.team_id)
      
      if existing_res
        all_new = false;
        break;
      else
        res.save
      end
    end
    
    if all_new
      render :text => "Success"
    else
      render :text => "Error"
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
  
  def delete_news
    po_news = News.find(params[:id])
    
    if po_news.delete
      render :text => "success"
    else
      render :text => "error"  
    end
  end
end