class AsesmentsController < ApplicationController
    
  def asesment_new
    @client = Client.find(params[:client_id])
    @asesment = @client.asesments.new
  end
  
  
  private
  
  params.require(:asesment).permit(:asesment_create_day, :praxis_place, :filling_up, :why_assesment, )
end
