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
    
    all_new = true;
    
    resses.each do |res|
      existing_res = Reservation.find_by_date_and_activity_and_starts_at(res.date, "Ice-time", res.starts_at)
      
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