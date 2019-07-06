class Home::Index < ApiAction
  get "/" do
    json({ message: "Hello world" })
  end
end
