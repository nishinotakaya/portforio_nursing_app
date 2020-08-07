class Client < ApplicationRecord
   has_many :monitorings, dependent: :destroy  
    
  before_save do
  self.date_of_day.gsub!(/[\[\]\"]/, "") if attribute_present?("date_of_day")
  end
  
  before_save do
  self.monitoring_exchange.gsub!(/[\[\]\"]/, "") if attribute_present?("monitoring_exchange")
  end    
end
