class Attachment < ActiveRecord::Base
  attr_accessible :path
  
  has_and_belongs_to_many :news
  
  def save_file(upload)
    name = sanitize_filename(upload['datafile'].original_filename)
    directory = "#{Rails.root}/public/docs"
    
    self.path = "/docs/#{name}"
    
    path = File.join(directory, name)
    
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
  
  def filename
    path = self.path[1, self.path.length] 
    path[(path.index('/') + 1), path.length]
  end
  
  def sanitize_filename(file_name)
    # get only the filename, not the whole path (from IE)
    just_filename = File.basename(file_name) 
    # replace all none alphanumeric, underscore or perioids
    # with underscore
    just_filename.sub(/[^\w\.\-]/,'_') 
  end
end
