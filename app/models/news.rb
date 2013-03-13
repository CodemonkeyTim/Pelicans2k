class News < ActiveRecord::Base
  attr_accessible :body, :edited_at, :edited_by_id, :published_at, :publisher_id, :title
  
  has_many :attachments
  
end
