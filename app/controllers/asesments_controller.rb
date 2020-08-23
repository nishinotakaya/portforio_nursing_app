class AsesmentsController < ApplicationController
    
  def asesment_new
    @client = Client.find(params[:client_id])
    @asesment = @client.asesments.new
  end
  
  def create_asesment_basic_info
    @client = Client.find(params[:client_id])
    @asesment = @client.asesments.new(asesment_params)
    if @asesment.save
       flash[:success] = "アセスメントを追加しました！"
       redirect_back_or @client
    else
      render asesment_new @client 
    end  
  end  
  
  
  private
  
  def asesment_params  
    params.require(:asesment).permit(:asesment_create_day, :praxis_place, :filling_up, :new_or_continuation, :insurance_number,
      :crying_email, :relation_name, :relation_email, :relation_joining, :relation_cellphone, :relation_name_2, :relation_email_2,
      :relation_joining_2, :relation_cellphone_2, :relation_name_3, :relation_email_3, :relation_joining_3, :relation_cellphone_3,
      :family_health_disease, :family_health_disease_past, :eyesight, :audition, :prosthesis, :nomal_vital_body_temperature, :nomal_vital_blood_pressure_up,
     :nomal_vital_blood_pressure_down, :nomal_vital_pulse, :medicina, :information_medicina, :information_medicina_family, :information_medicina_another,
    :hedge_medicine_food, :hedge_medicine_food_information, :hospital_name,:hospital_doctor, :hospital_doctor_nymber, :doctor_bath, :doctor_bath_another, :doctor_skin,
    :doctor_skin_another, :doctor_transfer, :doctor_transfer_another, :doctor_etcetera, :doctor_etcetera_another,:specialized_equipment, :check_a)
  end  
end
