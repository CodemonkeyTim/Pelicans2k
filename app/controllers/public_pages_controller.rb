class PublicPagesController < ApplicationController
  layout "public"
  
  def index
    @latest_news = News.order("published_at DESC").limit(3)
    @semi_latest = News.order("published_at DESC").limit(3).offset(3)
  end
  
  def teams
    @team = Team.find(params[:id])
  end
  
  def skating_school
  end
  
  def club
    
  end
  
  def rules
    
  end

  def links
    
  end
  
  def main_calendar
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
  
  def team_calendar
    @team = Team.find(params[:id])
    
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
  
  def news_archive
    
  end
  
  def show_news
    @news = News.find(params[:id])
  end
end
