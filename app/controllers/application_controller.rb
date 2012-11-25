class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def after_sign_in_path_for (resource)                                                                                                                                              
    "/landing"
    #case current_user.role
    #  when "admin" then return "/admin"
    #  when "head_coach" then return "/head_coach"
    #  when "team_leader" then return "/team_leader"
    #end
  end
end
