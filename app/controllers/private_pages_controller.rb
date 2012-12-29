class PrivatePagesController < ApplicationController
  
  layout "private"
  
  @sid = 86400
  
  def login
    unless current_user.nil?
      redirect_to "/landing"
    else
      render :layout => nil
    end
  end

  def landing
    last_id = News.last.id
    @latest_news = News.where("id > #{last_id-4}").reverse
  end
  
  def manage_news
    @news = News.all.reverse
  end
  
  def manage_main_calendar
    @days = ["Maanantai", "Tiistai", "Keskiviikko", "Torstai", "Perjantai", "Lauantai", "Sunnuntai"]
    
    @real_today = DateTime.now
    
    unless params[:diff]
      @today = @real_today
      @diff = 0;
    else
      @diff = params[:diff]
      @today = DateTime.now + (params[:diff].to_i * 7)
    end    
    
    @year = @today.year
    
    mon = @today.at_beginning_of_week
    
    tue, wed, thu, fri, sat, sun = 0
    
    dates = [mon, tue, wed, thu, fri, sat, sun]
    
    dates.each_with_index do |date, i|
      unless i == 6
        dates[i+1] = date.tomorrow
      end
    end
    
    @date_strs = []
    @th_date_strs = []
    dates.each do |date|
      @date_strs.push(date.strftime("%Y-%m-%d"))
      @th_date_strs.push(date.strftime("%d.%m"))
    end  
  end
  
  def manage_team_calendar
    @days = ["Maanantai", "Tiistai", "Keskiviikko", "Torstai", "Perjantai", "Lauantai", "Sunnuntai"]
    
    @real_today = DateTime.now
    
    unless params[:diff]
      @today = @real_today
      @diff = 0;
    else
      @diff = params[:diff]
      @today = DateTime.now + (params[:diff].to_i * 7)
    end    
    
    @year = @today.year
    
    mon = @today.at_beginning_of_week
    
    tue, wed, thu, fri, sat, sun = 0
    
    dates = [mon, tue, wed, thu, fri, sat, sun]
    
    dates.each_with_index do |date, i|
      unless i == 6
        dates[i+1] = date.tomorrow
      end
    end
    
    @date_strs = []
    @th_date_strs = []
    dates.each do |date|
      @date_strs.push(date.strftime("%Y-%m-%d"))
      @th_date_strs.push(date.strftime("%d.%m"))
    end
    
    if current_user.team_id != 0
      @team = Team.find(current_user.team_id) 
    end
  end
  
  def manage_players
    if (team_id = current_user.team_id) != 0 
      @team = Team.find(team_id)
    end 
  end
  
  def manage_staff
    team_id = current_user.team_id
    
    unless team_id == 0
      @team = Team.find(team_id)
    end 
  end
  
  def edit_staff
    @staff_member = StaffMember.find(params[:id])
  end
  
  def edit_players
    @player = Player.find(params[:id])
  end
  
  def edit_team
    @team = Team.find(params[:id])
  end
  
  def update_news
    @po_news = News.find(params[:id])
  end
  
  def manage_users
    
  end
  
  def edit_user
    @user = User.find(params[:id])
    if @user.role == "admin"
      render :text => "forbidden"
    end
  end
  
  def new_user_password
    @user = User.find(params[:id])
  end
end
