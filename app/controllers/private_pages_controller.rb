class PrivatePagesController < ApplicationController
  layout "private"
  
  def login
    render :layout => nil
  end

  def landing
  end
end
