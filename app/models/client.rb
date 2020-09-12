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

  scope :search, -> (search_params) do
    return if search_params.blank?

    client_name_like(search_params[:client_name])
    .date_of_day_is(search_params[:date_of_day])
    .client_birthday_from(search_params[:client_birthday])
  end
  scope :client_name_like, -> (client_name) { where('client_name LIKE ?', "%#{client_name}%") if client_name.present? }
  scope :date_of_day_is, -> (date_of_day) { where('date_of_day LIKE ?', "%#{date_of_day}%") if date_of_day.present? }
  scope :client_birthday_from, -> (client_birthday) { where('? <= client_birthday', client_birthday) if client_birthday.present? }
end
