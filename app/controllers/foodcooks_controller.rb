class FoodcooksController < ApplicationController
	# before_action :set_staff
	
	def food_check
		@client= Client.find(params[:client_id])
	end
	
	private
		# def set_staff
		# 	@staff = Staff.find(params[:staff_id])
		# end
end
