

class ComicsController < ApplicationController
		
	def index
		if params[:lib] || params[:search]
			timestamp = Time.now.seconds_since_midnight()
			ts = timestamp.to_s
			apikey= "d8c9ccab08d4170328675a86bf56d5b8"
			baseurl = "http://gateway.marvel.com/v1/public/"
			key = ENV['MARVEL_API_KEY']

			hash = Digest::MD5.hexdigest(ts + key + apikey)
			
			
			url = baseurl + params[:lib] + 
				"?ts=" + ts +
				"&apikey=" + apikey +
				"&hash=" + hash
				if params[:search]
					url = url + "&name=" + params[:search]
				end

			@parsedurl = url

			

			response = HTTParty.get(url)
			@response = JSON.parse(response.body)
		end
	end

end
