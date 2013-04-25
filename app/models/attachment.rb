class Attachment < ActiveRecord::Base
  attr_accessible :path
  
  has_and_belongs_to_many :news
  
  def save(upload)
    name = sanitize_filename(upload['datafile'].original_filename)
    directory = "#{Rails.root}/doc"
    
    path = File.join(directory, name)
    
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  def filename
    self.path[(self.path.index('/') + 1), self.path.length]
  end
  
  def sanitize_filename(file_name)
    # get only the filename, not the whole path (from IE)
    just_filename = File.basename(file_name) 
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_') 
  end
end
