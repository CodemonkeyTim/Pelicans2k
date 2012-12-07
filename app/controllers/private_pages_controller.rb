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
  end
  
  def manage_players
    
  end
  
  def manage_staffs
    
  end
  
  def update_news
    @po_news = News.find(params[:id])
  end
end
