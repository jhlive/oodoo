class TwilioHandlerController < ApplicationController
	def receive_message
		message = params[:message]
		TwilioMessage.create(message: message)
	end

	def home
	end
end
