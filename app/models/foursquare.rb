class Foursquare
	def self.query(params)
		uri = URI.parse("https://api.foursquare.com/v2/venues/search")  
		http_query = URI.encode_www_form(params)
		uri.query = http_query
		puts uri.to_s
		http = Net::HTTP.new(uri.host,uri.port)
		http.use_ssl = true
		http.ca_file = Rails.root.join("lib/ca.crt").to_s
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		req = Net::HTTP::Get.new(uri.path)
		res = http.request(req)
		JSON.parse(res.body)
	end
end