class Home::IndexPage < MainLayout
  def content
    section class: "hero is-fullheight is-primary" do
      div class: "hero-body" do
        div class: "container has-text-centered" do
          h1 "Hello world", class: "title"
        end
      end
    end
  end
end
