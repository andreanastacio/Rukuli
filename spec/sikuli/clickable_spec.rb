require 'spec_helper'

describe Rukuli::Region, "#Clickable" do
  before(:all) do
    @region = setup_test_area
  end

  it "should perform a click at 10, 10" do
    lambda { @region.click(12, 12) }.should_not raise_error
  end

  it "should perform a double click 10, 1040" do
    lambda { @region.double_click(12, 491) }.should_not raise_error
  end

  it "should perform a double click on an image" do
    lambda { @region.double_click("smiley_face.png") }.should_not raise_error
  end

  it "should perform a drag and drop" do
    lambda { @region.drag_drop(12, 12, 491, 491) }.should_not raise_error
  end

  it "should perform a click on an image" do
    lambda { @region.click("smiley_face.png") }.should_not raise_error
  end

  it "should not perform a click on an image that is outside of the region" do
    lambda { @region.click("apple.png") }.should
      raise_error(Rukuli::ImageNotFound, "The image 'apple.png' did not match in this region.")
  end

  it "should perform a click and hold on an image" do
    lambda { @region.click_and_hold(2, "green_apple.png") }.should_not raise_error
  end

  it "should perform a click and hold on a point" do
    lambda { @region.click_and_hold(2, 100, 100) }.should_not raise_error
  end

  it "should simulate a mouse scroll wheel up event" do
    lambda { @region.wheel_up(10) }.should_not raise_error
  end

  it "should simulate a mouse scroll wheel down event" do
    lambda { @region.wheel_down(10) }.should_not raise_error
  end
end
