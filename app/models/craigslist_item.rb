class CraigslistItem < ActiveRecord::Base
  attr_accessible :contactName, :date, :number, :textBody
end
