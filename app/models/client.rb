class Client < ApplicationRecord
  has_many :monitorings, dependent: :destroy
  has_many :asesments, dependent: :destroy
  has_many :businesslogs, dependent: :destroy
  accepts_nested_attributes_for :businesslogs
  has_many :foodcooks, dependent: :destroy
  has_many :nurselogs, dependent: :destroy 
  paginates_per 5 

  before_save do
    self.date_of_day.gsub!(/[\[\]\"]/, "") if attribute_present?("date_of_day")
  end
  
  #before_save do
  #self.monitoring_exchange.gsub!(/[\[\]\"]/, "") if attribute_present?("monitoring_exchange")
  #end    
end
