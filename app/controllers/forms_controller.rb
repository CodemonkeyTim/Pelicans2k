class FormsController < ApplicationController
  layout "private"
  
  def add_attachment
    att = Attachment.new
    att.save_file(params[:upload])
    
    if att.save
      redirect_to "/uutisten_hallinta"
    else
      render :text => "Jotain meni vikaan"
    end
  end
  
end
