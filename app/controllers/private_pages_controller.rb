class PrivatePagesController < ApplicationController
  layout "private"
  
  def login
    render :layout => nil
  end

  def landing
  end
  
  def manage_news
    
  end
  
  def manage_main_calendar
    
  end
  
  def manage_players
    
  end
  
  def manage_staffs
    
  end
end
