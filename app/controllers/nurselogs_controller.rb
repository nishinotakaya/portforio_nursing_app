class NurselogsController < ApplicationController
	# before_action :set_staff

	def new_nurse_log
		@client= Client.find(params[:client_id])
	end
	
	private
	# def set_staff
	# @staff = Staff.find(params[:staff_id])
	# end
end
