class Office < ApplicationRecord
  
  validates :office_number, presence: true, :numericality => { :greater_than_or_equal_to => 0 }  
  validates :office_name, presence: true
  validates :office_modality, presence: true 
end
