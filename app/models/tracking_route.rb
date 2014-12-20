class TrackingRoute < ActiveRecord::Base
  belongs_to :device
  has_many :positions

  def has_stopped?
  	self.end_at.present?
  end
end
