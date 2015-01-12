json.array!(@devices) do |device|
  json.extract! device, :id, :phone_number, :alias_name, :lock, :moving, :user_id, :created_at, :updated_at
  json.url device_url(device, format: :json)
end

