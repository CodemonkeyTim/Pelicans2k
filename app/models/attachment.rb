class Attachment < ActiveRecord::Base
  attr_accessible :path, :file_type, :display_name
  
  has_and_belongs_to_many :news
  
  def self.save(upload)
    name = sanitize_filename(upload['datafile'].original_filename)
    directory = "#{Rails.root}/doc"
    
    path = File.join(directory, name)
    
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  def sanitize_filename(file_name)
    # get only the filename, not the whole path (from IE)
    just_filename = File.basename(file_name) 
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_') 
  end
end
