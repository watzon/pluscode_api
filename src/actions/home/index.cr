class Home::Index < ApiAction
  get "/" do
    json({
      "message" => "Welcome to the pluscode api. See /api for endpoint information.",
      "author" => "Chris Watson"
    })
  end
end
