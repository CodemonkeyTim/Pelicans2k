class PrivatePagesController < ApplicationController
  layout "private"
  
  @sid = 86400
  
  def login
    render :layout => nil
  end

  def landing
  end
  
  def manage_news
    
  end
  
  def manage_main_calendar
    @days = ["Maanantai", "Tiistai", "Keskiviikko", "Torstai", "Perjantai", "Lauantai", "Sunnuntai"]
    @year = Time.now.strftime("%Y")
    
    today = DateTime.now
    mon = today.at_beginning_of_week
    
    tue, wed, thu, fri, sat, sun = 0
    
    dates = [mon, tue, wed, thu, fri, sat, sun]
    
    dates.each_with_index do |date, i|
      unless i == 6
        dates[i+1] = date.tomorrow
      end
    end
    
    @date_strs = []
    
    dates.each do |date|
      @date_strs.push(date.strftime("%d.%m"))
    end  
  end
  
  def manage_players
    
  end
  
  def manage_staffs
    
  end
end
