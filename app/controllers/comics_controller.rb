

class ComicsController < ApplicationController
		
	def index
		apikey= "&apikey=d8c9ccab08d4170328675a86bf56d5b8"
		@url = "http://gateway.marvel.com:80/v1/public/" +
		params[:lib] + 
		"?name=" + params[:search] + apikey

		response = HTTParty.get(@url)

		@response = JSON.parse(response.body)
		
	end

		# def search
			
		# end
end
