# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "Seeding database"
u = User.create(name: "Rene", lastname: "Garcia", email: "rene.garciah90@gmail.com", facebook_token: SecureRandom.hex(16));
(1..5).each do |number|
	d = Device.create(alias_name: "Device ##{number}", phone_number: "+12069390204", user_id: u.id)
end

track_points = 	[
	{latitude: 47.661400, longitude:-122.341642},
	{latitude: 47.661372, longitude:-122.339153},
	{latitude: 47.661400, longitude:-122.337007},
	{latitude: 47.661372, longitude:-122.334089},
	{latitude: 47.661458, longitude:-122.334132},
	{latitude: 47.661429, longitude:-122.327222},
	{latitude: 47.661343, longitude:-122.325162},
	{latitude: 47.661372, longitude:-122.323575},
	{latitude: 47.661343, longitude:-122.318510},
	{latitude: 47.663424, longitude:-122.316408},
	{latitude: 47.665909, longitude:-122.316408},
	{latitude: 47.668019, longitude:-122.316236},
	{latitude: 47.670302, longitude:-122.316279},
	{latitude: 47.674637, longitude:-122.315678},
	{latitude: 47.680560, longitude:-122.315592},
	{latitude: 47.685559, longitude:-122.312073},
	{latitude: 47.687003, longitude:-122.311601},
	{latitude: 47.688534, longitude:-122.313446},
	{latitude: 47.688534, longitude:-122.316579},
	{latitude: 47.687292, longitude:-122.317481},
	{latitude: 47.686743, longitude:-122.320098}
]
Device.all.each do |device|
	(1..10).each do |i|
		start = DateTime.now+i.days
		stop = i < 10 ? start + 2.hours : nil
		tr = TrackingRoute.create(started_at: start, end_at: stop, device_id: device.id )
		track_points.each do |point|
			tr.positions << Position.new(tracking_route_id: tr.id, latitude: point[:latitude], longitude: point[:longitude], message: "....")
		end
	end
end
puts "Done!!"
								