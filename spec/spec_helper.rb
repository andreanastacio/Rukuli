require 'java'

require 'yaml'
require 'rspec'
require 'rukuli'

APPLICATIONS = YAML.load(File.open("#{Dir.pwd}/spec/support/applications.yml"))

Rukuli::Config.logging = false

def application(app)
  APPLICATIONS[app].select { |k, _| k =~ /#{RbConfig::CONFIG['host_os']}/ }.shift[1]
end

def setup_test_area
  Rukuli::Config.image_path = "#{Dir.pwd}/spec/support/images/"
  screen = Rukuli::Screen.new
  app = Rukuli::App.new(application "IMAGE_VIEWER")
  app.focus()
  center = screen.find("#{Dir.pwd}/spec/support/images/smiley_face.png")

  test_area = Rukuli::Region.new(center.x - 212, center.y - 212, 503, 503)
  test_area.highlight

  test_area
end
