json.tracking_route do 
	json.device_id @tracking_route.device_id
	json.started_at @tracking_route.started_at || ""
	json.end_at @tracking_route.end_at || ""
	json.created_at @tracking_route.created_at || ""
	json.updated_at @tracking_route.updated_at || ""
	json.array! @tracking_route.postions do |postion|
		json.id position.id
		json.message position.message
		json.lattitude position.lattitude
		json.longitude position.longitude
		json.tracking_route_id position.tracking_route_id
		json.created_at position.created_at || ""
		json.updated_at position.updated_at || ""
	end
end