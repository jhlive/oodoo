class TwilioHandlerController < ApplicationController
	respond_to :xml
	def receive_message
		puts params
	end
end
