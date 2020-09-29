class ShiftsController < ApplicationController


	def staff_sfift
		@staffs = Staff.all
		@first_day = Date.current.beginning_of_month
		@last_day = @first_day.end_of_month
		@shifts = Shift.where(shift_day: @first_day..@last_day).order(:staff_id, :shift_day)
	end	


	def shifts_change
		@first_day = params[:date].nil? ? 
    #params[:date]（showの月の隣の矢印が押されたか？)がnilか？
    #月初日が今月か？先月か？先々月か？のもの #当月分のデータを取得してだしてあげてる！
    Date.current.beginning_of_month : params[:date].to_date
		@last_day = @first_day.end_of_month
		@staffs = Staff.where(check_shift: true)
	end
	
	def shifts_update
		
	end	

	private

end

