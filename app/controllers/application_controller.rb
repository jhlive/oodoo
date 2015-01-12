class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


	def current_user
		@current_user ||= (User.where(facebook_token: request.headers["facebook-token"]).first || User.first )
	end
	helper_method :current_user

	def user_signed_in?
		unless current_user.nil?
			render json: {message: "User not authenticated"}, :status=>401
		end
	end

	def restrict_acces_to_app
		unless request.headers["app-token"] == ENV["APP_TOKEN_ID"]
			render json: {message: "APP_TOKEN missing"}, :status=>403
		end
	end

end
