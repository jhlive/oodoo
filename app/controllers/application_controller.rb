class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead....
  protect_from_forgery with: :null_session


	def current_user
		@current_user ||=  User.where(facebook_token: request.headers["facebook-token"], facebook_id: request.headers["facebook-user-id"]).first
	end
	helper_method :current_user

	def user_signed_in?
		puts current_user
		if current_user.nil?
			render json: {message: "User not authenticated"}, :status=>:ok
		end
	end

	def restrict_acces_to_app
		unless request.headers["app-token"] == ENV["APP_TOKEN_ID"]
			render json: {message: "APP_TOKEN missing"}, :status=>:ok
		end
	end

end
