class API::Index < ApiAction
  route do
    json({
      "endpoints" => {
        "/api/v1/address/encode": {
          "description" => "create a pluscode from an address",
          "params"      => {
            "address" => {
              "description" => "the address to convert",
              "type"        => "string",
              "required"    => true,
            },
            "code_length" => {
              "description" => "the length of the code to create",
              "type"        => "int",
              "required"    => false,
            },
          },
          "returns" => {
            "json" => {
              "address"   => "string",
              "latitude"  => "float",
              "longitude" => "float",
              "pluscode"  => "string",
            },
          },
        },
        "/api/v1/address/decode": {
          "description" => "create an address from a pluscode",
          "params"      => {
            "code" => {
              "description" => "the code to convert",
              "type"        => "string",
              "required"    => true,
            },
          },
          "returns" => {
            "json" => {
              "latitude"   => "float",
              "longitude"  => "float",
              "codelength" => "int",
              "code"       => "string",
            },
          },
        },
        "/api/v1/plus_code/encode": {
          "description" => "create a pluscode from a latitude and longitude",
          "params"      => {
            "lat" => {
              "description" => "the latitude",
              "type"        => "float",
              "required"    => true,
            },
            "lng" => {
              "description" => "the longitude",
              "type"        => "float",
              "required"    => true,
            },
            "code_length" => {
              "description" => "the length of the code to create",
              "type"        => "int",
              "required"    => false,
            },
          },
          "returns" => {
            "json" => {
              "code" => "string",
            },
          },
        },
        "/api/v1/plus_code/decode": {
          "description" => "retrieve a latitude and longitude from a pluscode",
          "params"      => {
            "code" => {
              "description" => "the code to convert",
              "type"        => "string",
              "required"    => true,
            },
          },
          "returns" => {
            "json" => {
              "latitude"  => "float",
              "longitude" => "float",
              "code"      => "string",
            },
          },
        },
      },
    })
  end
end
