class TwilioHandlerController < ApplicationController
	def receive_message
		message = params[:Body] || params[:body]
		TwilioMessage.create(message: message)
	end

	def home
	end
end
