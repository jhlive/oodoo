class Device < ActiveRecord::Base
	belongs_to :user
	has_many :tracking_routes
	include TwilioApi

	def is_locked?
		self.lock
	end

	def is_unlock?
		!self.is_locked?
	end

	def last_tracking_route
		@last_tracking_route ||= self.tracking_routes.includes(:positions).where(end_at: nil).order("started_at desc").first
	end

	def send_position_request
		position_request_message = "the message..." #TODO: Change this message to the actual sms request message
		self.send_sms(self.phone_number, position_request_message)
	end

	def start_tracking
		if self.is_unlock?
			self.lock = true
			self.tracking_routes << TrackingRoute.new(started_at: DateTime.now )
			self.save
			puts "Sending Position Request..."
			#self.send_position_request
			return true
		else
			puts "Sending Position Request..."
			return false
		end
	end

	def stop_tracking
		if self.is_locked
    	tracking_route = self.last_tracking_route
    	tracking_route.end_at = DateTime.now
    	tracking_route.save
    	self.lock = false
    	self.save
		else
			return false
		end
	end

	def track_position(message)
		route = self.last_tracking_route
		route.positions << Position.build_from_message(message) unless route.nil?
	end
end
