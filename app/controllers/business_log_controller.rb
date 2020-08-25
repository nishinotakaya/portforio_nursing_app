class BusinessLogController < ApplicationController

  def new_business_log
    @client = Client.find(params[:client_id])
  end
  
  def affter_business_log
    @client = Client.find(params[:client_id])
    @log = Business_log.find(params[:id])
  end
  
	def create_business_log
		@client = Client.find(params[:client_id])
		@log = @client.business_log.new(log_params)
			if params[:business_log][:check_log] == "true"  
				if @log.save
					flash[:success] = "アセスメントを追加しました！"
					redirect_back_or @client
				else
					render action: :asesment_new
				end
			else
				flash[:danger] = "確認チェックをしてください！"
				render action: :business_log_new 
			end  
  end  
end
