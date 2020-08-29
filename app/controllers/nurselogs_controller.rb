class NurselogsController < ApplicationController


	def new_nurse_log
		@client= Client.find(params[:client_id])
	end
	
	
end
