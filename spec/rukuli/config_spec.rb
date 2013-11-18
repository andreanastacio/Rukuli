require 'spec_helper'

describe Rukuli::Config do
  it "should retain a list of directories to search in for images" do
    Rukuli::Config.image_path = ""
    java.lang.System.getProperty("SIKULI_IMAGE_PATH").should == ""
  end

  it "should allow a path to be added" do
    Rukuli::Config.run do |config|
      config.image_path = '/Users/images/'
    end

    java.lang.System.getProperty("SIKULI_IMAGE_PATH").should == '/Users/images/'
    Rukuli::Config.image_path.should == '/Users/images/'
  end

  it "should allow logging to be turned on" do
    Rukuli::Config.run do |config|
      config.logging = true
    end

    org.sikuli.script::Settings.InfoLogs.should be_true
    org.sikuli.script::Settings.ActionLogs.should be_true
    org.sikuli.script::Settings.DebugLogs.should be_true
  end

  it "should allow logging to be turned off" do
    Rukuli::Config.run do |config|
      config.logging = false
    end

    org.sikuli.script::Settings.InfoLogs.should be_false
    org.sikuli.script::Settings.ActionLogs.should be_false
    org.sikuli.script::Settings.DebugLogs.should be_false
  end

  it "should allow us to turn off highlighting on find" do
    Rukuli::Config.highlight_on_find = false
    Rukuli::Config.highlight_on_find.should be_false
  end

  it "should allow us to turn on highlighting on find" do
    Rukuli::Config.highlight_on_find = true
    Rukuli::Config.highlight_on_find.should be_true
  end
end
