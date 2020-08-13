class AsesmentsController < ApplicationController
    
  def asesment_new
    @client = Client.find(params[:client_id])
  end  
end
