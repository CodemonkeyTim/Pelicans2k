class Attachment < ActiveRecord::Base
  attr_accessible :news_id, :path, :file_type, :display_name
  
  belongs_to :news
end
