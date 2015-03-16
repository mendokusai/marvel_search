

class ComicsController < ApplicationController
		
	def index
		@apikey= "d8c9ccab08d4170328675a86bf56d5b8"
		baseurl = "http://gateway.marvel.com/v1/public/"
		@key = ENV['MARVEL_API_KEY']

		if params[:lib] || params[:search]
			ts = params[:ts]

			hash = Digest::MD5.hexdigest(ts + @key + @apikey)
			
			
			url = baseurl + params[:lib] + 
				"?ts=" + ts +
				"&apikey=" + @apikey +
				"&hash=" + hash
				if params[:search]
					#add bit to handle two-name names
					url = url + "&name=" + params[:search]
				end

			@parsedurl = url
			response = HTTParty.get(url)
			@response = JSON.parse(response.body)
		end
		
		if params[:links]
			baseurl = params[:links]
			ts = params[:nts]
			hash = Digest::MD5.hexdigest(ts + @key + @apikey)
			url = baseurl +
			"?ts=" + ts +
			"&apikey=" + @apikey +
			"&hash=" + hash
			@linkurl = url
			response = HTTParty.get(url)
			@link = JSON.parse(response.body)
		end

	end

end
