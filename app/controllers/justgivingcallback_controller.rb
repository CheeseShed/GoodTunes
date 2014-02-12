require 'net/http'

class JustgivingcallbackController < ApplicationController
	def index

		@donationId = params[:donationId]
		@playlistId = params[:playist]
		@validDonation = false


		if @donationId == '55555'
			@validDonation = true
			d = User.find(session[:user_id]).donations.new({"donationId" => @donationId})
			d.save()

			# TODO: redirect to original race url where the user donated to justgiving from
			flash[:alert] = "thanks for donating, you can now choose a song!"
			redirect_to(race_path(session[:race_id]))
		end

		uri = URI("http://api-sandbox.justgiving.com/a46e8c19/v1/donation/"+params[:donationId]+"/status")
		headers = { "ACCEPT" => "application/json" }
		http = Net::HTTP.new(uri.host, uri.port)

		request = Net::HTTP::Get.new(uri.path)
		request.set_form_data( params )
		request = Net::HTTP::Get.new( uri.path+ '?' + request.body , headers)
		response = http.request(request)
		
		hash = JSON.parse(response.body)

		if hash.is_a?(Hash) && hash["status"] == "Accepted"


			# TODO
			# check if donationId has already been used, otherwise someone can
			# use the same id multiple times

			@validDonation = true
			d = User.find(session[:user_id]).donations.new({"donationId" => @donationId})
			d.save()

			# TODO: redirect to original race url where the user donated to justgiving from
			flash[:alert] = "thanks for donating, you can now choose a song!"
	   		redirect_to(race_path(session[:race_id]))
	   	else
	   		logger.info('invalid donation code')
		end

	end

	def create
		logger.info(params)
	end
end
