require "json"
require "pluscode"

class API::PlusCode::Encode < ApiAction
  param lat : Float64
  param lng : Float64
  param code_length : Int32?

  get "/api/plus-code/encode" do
    response = { "code" => ::PlusCode.encode(lat, lng, code_length || 10) }
    json response
  end
end
