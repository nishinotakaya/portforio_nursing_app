class Monitoring < ApplicationRecord
  belongs_to :client
    #validates :worked_on, presence: true 
end
