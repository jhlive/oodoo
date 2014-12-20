class Position < ActiveRecord::Base
	belongs_to :tracking_route

	def self.build_from_message(message)
		#TODO GET THE GOOGLE MAPS URL SENT BY THE DEVICE AND PARSE IT TO LATTITUDE AND LONGITUDE FORMAT
		self.new(message: message)
	end
end
