require 'java'

require 'rspec'
require 'rukuli'

Rukuli::Config.logging = false

def setup_test_area
  Rukuli::Config.image_path = "#{Dir.pwd}/spec/support/images/"
  screen = Rukuli::Screen.new
  app = Rukuli::App.new('Preview')
  app.focus()
  center = screen.find("#{Dir.pwd}/spec/support/images/smiley_face.png")

  test_area = Rukuli::Region.new(center.x - 212, center.y - 212, 503, 503)
  test_area.highlight

  test_area
end
