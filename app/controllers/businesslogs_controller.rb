class BusinesslogsController < ApplicationController
	# before_action :set_staff	
	
	def businesslog_clients
		@client= Client.find(params[:client_id])
		@clients= Client.all
	end	

	def businesslog_clients_create #本日の業務日誌client提出

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
	def affter_businesslog
		@client = Client.find(params[:client_id])
		@businesslog = Businesslog.find(params[:id])
	end	
	
		private

		def log_params
			params.permit(:log_year, :log_month, :log_day, :log_week, :log_farewell, :log_bath, :log_food, :log_good_staple_dosage, :log_good_side_dosage, :log_body_temperature, :log_pressure_up, :log_pressure_down, :log_pulse, :re_log_pressure_up, :re_log_pressure_down,
				                                  	:re_log_body_temperature, :re_log_pulse,:log_special_mention, :log_record_stamp,:check_log, :log_foods, :log_check_return, :check_log_hand_washing, :check_log_brush_teeth, :log_worked_on)
		end
		
		# def set_staff
		# 	@staff = Staff.find(params[:staff_id])
		# end
	  


end
