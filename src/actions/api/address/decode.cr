require "uri"
require "json"
require "pluscode"
require "google_maps_api"

class API::Address::Decode < ApiAction
  param code : String

  get "/api/address/decode" do
    begin
      response = build_response
    rescue exception
      error = { error: "Failed to parse the pluscode #{code}" }
      return json error, status: 503
    end

    json response
  end

  def build_response
    pluscode = code.gsub(/\s+/, '+')
    area = ::PlusCode.decode(pluscode)
    response = GoogleMapsApi::Geocoding.latlng_search(area.north_latitude, area.west_longitude)

    response_items = [] of AddressResponse

    response.each do |item|
      address = item.formatted_address
      latitude = item.geometry.location.lat
      longitude = item.geometry.location.lng
      response_items << AddressResponse.new(address, latitude, longitude, pluscode)
    end

    response_items
  end

  record AddressResponse, address : String, latitude : Float32, longitude : Float32, pluscode : String do
    include JSON::Serializable
  end
end
