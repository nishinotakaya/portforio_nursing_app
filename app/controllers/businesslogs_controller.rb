class BusinesslogsController < ApplicationController
	# before_action :set_staff	
	
	def businesslog_clients #本日の利用者チェック業務日誌一覧
		@clients= Client.all
		@client =Client.find(params[:client_id])
	end	

	def update_businesslog_client_now #本日の利用者の業務日誌
		ActiveRecord::Base.transaction do
			@client= Client.find(params[:client_id])
			n1 = 0
			check_params.each do |item|
				if item[:business_log_use_check] == "true"
					if item[:business_log_use_check] == "true"
						n1 = n1 + 1
					end
						@clients.update_attributes!(item)
				end
					flash[:success] = "業務日誌を#{x1}追加しました！"
					redirect_to  businesslog_clients_url @client 
			end
		end					
	rescue ActiveRecord::RecordInvalid
		flash[:danger] = "無効な入力データがあった為、更新をキャンセルしました。"
	redirect_to crients_url(@client)
	end	
					
		

				
	
	def affter_businesslog
		@client = Client.find(params[:client_id])
		@businesslog = Businesslog.find(params[:id])
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

	
		private

		def log_params
			params.permit(:log_year, :log_month, :log_day, :log_week, :log_farewell, :log_bath, :log_food, :log_good_staple_dosage, :log_good_side_dosage, :log_body_temperature, :log_pressure_up, :log_pressure_down, :log_pulse, :re_log_pressure_up, :re_log_pressure_down,
				                                  	:re_log_body_temperature, :re_log_pulse,:log_special_mention, :log_record_stamp,:check_log, :log_foods, :log_check_return, :check_log_hand_washing, :check_log_brush_teeth, :log_worked_on)
		end
		
		def check_params #本日の業務日誌チェック
			params.require(:client).permit(businesslogs: [:business_log_use_check])[:businesslog]
		end	
	  


end
