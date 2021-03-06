require 'rest-client'
require 'json'

class GetGoogleCoffeListService
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

#execute

  def call
    begin
      key = "key=#{Rails.application.credentials.google_secret_key}"
      location = "location=#{@latitude},#{@longitude}"
      radius= "radius=5000"
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffe+shops&#{location}&#{radius}&#{key}"
      response = RestClient.get base_url
      JSON.parse(response.body)
    rescue RestClient::ExceptionsWithResponse =>
      e.response
    end
  end
end