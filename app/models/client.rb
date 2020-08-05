class Client < ApplicationRecord
    
  before_save do
self.date_of_day.gsub!(/[\[\]\"]/, "") if attribute_present?("date_of_day")
end    
end
