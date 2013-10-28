class News < ActiveRecord::Base
  attr_accessible :body, :edited_at, :edited_by_id, :published_at, :publisher_id, :title
  
  has_and_belongs_to_many :attachments
  accepts_nested_attributes_for :attachments
  
  def formatted_body
    self.body.gsub("\n", "<br />")
  end
end
