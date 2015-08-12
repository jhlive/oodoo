class SessionsController < ApplicationController
  #before_action :restrict_acces_to_app
  before_action :user_signed_in?, except: [:create]
  def create
  	@current_user = User.sign_up_or_sign_in(user_params)
  end

  def destroy
  	@current_user.facebook_token = nil
  	@current_user.save
  	respond_to do |format|
  		format.json { render json: {message: "Session Has ended"}, status: :ok }
  	end
  end

  def user_params
  	params.require(:user).permit!
  end
end
