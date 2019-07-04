require "json"
require "pluscode"

class API::PlusCode::Decode < ApiAction
  param code : String

  get "/api/plus-code/decode" do
    pluscode = code.gsub(/\s+/, '+')

    begin
      area = ::PlusCode.decode(pluscode)
    rescue ex
      error = { error: "Failed to parse the pluscode #{pluscode}" }
      return json error, status: 503
    end

    response = {
      "latitude": area.north_latitude,
      "longitude": area.west_longitude,
      "code": pluscode
    }
    json response
  end
end
