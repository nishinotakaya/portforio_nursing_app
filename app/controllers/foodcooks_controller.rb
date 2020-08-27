class FoodcooksController < ApplicationController
	def food_check
		@client= Client.find(params[:client_id])
	end	
end
