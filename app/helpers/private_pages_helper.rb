# encoding: UTF-8

module PrivatePagesHelper
  
  def translate_role role
    case role
      when "head_coach" 
        return "Valmennuspäällikkö"
      when "team_leader" 
        return "Joukkueenjohtaja"
      when "coach" 
        return "Valmentaja"
      end
  end
end
