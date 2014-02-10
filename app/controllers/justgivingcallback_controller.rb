require 'net/http'

class JustgivingcallbackController < ApplicationController
	def index

		@donationId = params[:donationId]
		@playlistId = params[:playist]
		@validDonation = false


		

		# STUB SUCCESS HERE

		# if donation is valid, create a new donation model instance, which enables
		# a user to pick a song
		@validDonation = true

		d = User.find(session[:user_id]).donations.new({"donationId" => "abc"})
		d.save()

		# TODO: redirect to original race url where the user donated to justgiving from
		flash[:alert] = "thanks for donating, you can now choose a song!"
   		redirect_to(race_path(params[:race_id]))




		# uri = URI("http://api-sandbox.justgiving.com/a46e8c19/v1/donation/"+params[:donationId]+"/status")
		# headers = { "ACCEPT" => "application/json" }
		# http = Net::HTTP.new(uri.host, uri.port)

		# request = Net::HTTP::Get.new(uri.path)
		# request.set_form_data( params )
		# request = Net::HTTP::Get.new( uri.path+ '?' + request.body , headers)
		# response = http.request(request)

		# logger.info(response.body)

		# hash = JSON.parse(response.body)

		# logger.info(hash)

		# if hash["status"] == "Accepted"
		# 	@validDonation = true
		# 	redirect_to "/playlists/3"
		# end

	end

	def create
		logger.info(params)
	end
end
