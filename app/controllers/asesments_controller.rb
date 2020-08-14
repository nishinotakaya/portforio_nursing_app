class AsesmentsController < ApplicationController
    
  def asesment_new
    @client = Client.find(params[:client_id])
    @asesment = @client.asesments.new
  end
  
  
  private
  
  params.require(:asesment).permit(:asesment_create_day, :praxis_place, :filling_up, :why_assesment, :family_name, :family_joining, :family_age, :family_health, :crying_email_name, :crying_email_joining,
  :crying_email_life, :crying_call, :first_time_reception, :reception_method, :reception_requester, :counselling_route, :life_history, :life_now, :trauma_old_people_adl, :dementia_old_people_adl, 
  :nursing_number_day, :nursing_number_duration, :nursing_care_on_sickness_insurance, :health_insurence, :handicapped_notebook, :livelihood_protection, :nursing_care_service, :nursing_care_service_call, 
  :nursing_care_service_content)
end
