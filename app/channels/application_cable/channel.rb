module ApplicationCable
  class Channel < ActionCable::Channel::Base
    #  before_save :date_of_day_client
     
    def date_of_day_client
      self.date_of_day.gsub!(/[\[\]\"]/, "").gsub!(" ","")if attribute_present?("date_of_day")
    end 
  end
end
