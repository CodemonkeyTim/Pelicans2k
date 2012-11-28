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
    
    
  end
  
  def manage_players
    
  end
  
  def manage_staffs
    
  end
end
