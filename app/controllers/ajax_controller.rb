class AjaxController < ApplicationController
  def get_cal_for_team
    @team = Team.find(params[:team_id])
    render :json => @team.reservations
  end
end
