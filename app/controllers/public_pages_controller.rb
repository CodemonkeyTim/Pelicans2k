class PublicPagesController < ApplicationController
  layout "public"
  
  def index
    @latest_news = News.order("published_at DESC").limit(3)
    @semi_latest = News.order("published_at DESC").limit(3).offset(3)
  end
  
  def teams
    
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
    
    
  end
  
  def team_calendar
    
  end
  
  def news
    
  end
end
