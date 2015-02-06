class User < ActiveRecord::Base
  has_many :devices

  def self.sign_up_or_sign_in(user_params)
  	user = self.where(user_params).first
  	unless user.present?
  		user = User.create(user_params)
  	end
  	return user
  end
end
