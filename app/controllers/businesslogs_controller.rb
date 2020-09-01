class BusinesslogsController < ApplicationController
	# before_action :set_staff	
	
	
	def affter_businesslog
		@client = Client.find(params[:client_id])
		@businesslog = Businesslog.find(params[:id])
	end	

	def update_businesslog
		@client = Client.find(params[:client_id])
		@businesslog = Businesslog.find(params[:id])
			if @businesslog.update_attributes(log_update_params)
				if params[:businesslog][:check_log] == "true"
					flash[:success] = "#{@client.client_name}様の利用者情報報告書を更新しました。"
					redirect_to client_url(@client)
				else 
					flash[:danger] = "確認をチェックしてください"
					render action: :affter_businesslog  
				end
		else
			flash[:danger] = "#{@client.client_name}様の利用者情報報告書の更新は失敗しました。<br>" + @client.errors.full_messages.join("<br>")
			render action: :affter_businesslog 
		end    
	end	


	


	def new_businesslog
		@client= Client.find(params[:client_id])
	end
	  
	  def create_businesslog
			@client = Client.find(params[:client_id])
			if params[:check_log] == "true" 
				@businesslog = @client.businesslogs.new(log_params) 
					if @businesslog.save
					flash[:success] = "業務日誌を追加しました！"
					redirect_back_or @client
					end
			else
			flash[:danger] = "確認チェックをしてください！"	
			render action: :new_businesslog
			end
		end

		def businesslog_completion
			@client = Client.find(params[:client_id])
			@businesslog = Businesslog.find(params[:id])
		end	

		def businesslog_clients_index
			@client = Client.find(params[:client_id])
			@clients = Client.where(use_check: true)
		end	

	
		private

		def log_params
			params.permit(:log_year, :log_month, :log_day, :log_week, :log_farewell, :log_bath, :log_food, :log_good_staple_dosage, :log_good_side_dosage, :log_body_temperature, :log_pressure_up, :log_pressure_down, :log_pulse, :re_log_pressure_up, :re_log_pressure_down,
				                                  	:re_log_body_temperature, :re_log_pulse,:log_special_mention, :log_record_stamp,:check_log, :log_foods, :log_check_return, :check_log_hand_washing, :check_log_brush_teeth, :log_worked_on,:log_special_mention )
		end

		def log_update_params
			params.require(:businesslog).permit(:log_year, :log_month, :log_day, :log_week, :log_farewell, :log_bath, :log_food, :log_good_staple_dosage, :log_good_side_dosage, :log_body_temperature, :log_pressure_up, :log_pressure_down, :log_pulse, :re_log_pressure_up, :re_log_pressure_down,
				                                  	:re_log_body_temperature, :re_log_pulse,:log_special_mention, :log_record_stamp,:check_log, :log_foods, :log_check_return, :check_log_hand_washing, :check_log_brush_teeth, :log_special_mention, :log_worked_on)
		end
		
		def check_params #本日の業務日誌チェック
			params.require(:client).permit(businesslogs: [:business_log_use_check])[:businesslog]
		end	
	  


end
