module TwilioApi
	extend ActiveSupport::Concern
	attr_accessor :twilio_client
	
	included do
    @twilio_client = Twilio::REST::Client.new ENV['TWILIO_ASID'], ENV['TWILIO_ATOK']
  end

  def send_sms(number, message)
		@obj = @twilio_client.account.sms.messages.create(
		  :from => ENV['TWILIO_NUMBER'],
		  :to => number,
		  :body => message
		)
	end
end