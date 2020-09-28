class ShiftsController < ApplicationController


	def staff_sfift
		@staffs = Staff.all
		@first_day = Date.current.beginning_of_month
		@last_day = @first_day.end_of_month
		@shifts = Shift.where(shift_day: @first_day..@last_day).order(:staff_id, :shift_day)
	end	


	def shifts_change
		@first_day = Date.current.beginning_of_month
		@last_day = @first_day.end_of_month
		@staffs = Staff.where(check_shift: true)
	end
	
	
end

