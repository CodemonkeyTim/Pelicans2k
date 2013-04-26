class FormsController < ApplicationController
  layout "private"
  
  def add_attachment
    att = Attachment.new
    att.save_file(params[:upload])
  end
  
end
