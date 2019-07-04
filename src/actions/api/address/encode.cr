require "uri"
require "json"
require "pluscode"
require "google_maps_api"

class API::Address::Encode < ApiAction
  param address : String
  param code_length : Int32?

  get "/api/address/encode" do
    addr = URI.unescape(address)
    response = GoogleMapsApi::Geocoding.address_search(addr)
    json build_response(response)
  end

  def build_response(json)
    response_items = [] of AddressResponse
    json.each do |item|
      address = item.formatted_address
      latitude = item.geometry.location.lat
      longitude = item.geometry.location.lng
      pluscode = ::PlusCode.encode(latitude, longitude, code_length || 10)
      response_items << AddressResponse.new(address, latitude, longitude, pluscode)
    end
    response_items
  end

  record AddressResponse, address : String, latitude : Float32, longitude : Float32, pluscode : String do
    include JSON::Serializable
  end
end
