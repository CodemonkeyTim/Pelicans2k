class Attachment < ActiveRecord::Base
  attr_accessible :news_id, :path, :file_type, :display_name
  
  belongs_to :news
  
  def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
end
