class OfficesController < ApplicationController
  
  def index
    @offices = Office.all
  end
  
  def edit
    @office = office.find(params[:id])
  end  

  
  private
    def set_office
      @office = office.find(params[:id])
    end
    
    def office_params
      params.require(:office).permit(:office_number, :office_name, :office_modality)
    end

  
    
end    
