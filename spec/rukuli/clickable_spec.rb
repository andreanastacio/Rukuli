require 'spec_helper'

describe Rukuli::Region, "#Clickable" do
  before(:all) do
    @region = setup_test_area
  end

  it "should perform a click at 10, 10" do
    expect { @region.click(12, 12) }.not_to raise_error
  end

  it "should perform a double click 10, 1040" do
    expect { @region.double_click(12, 491) }.not_to raise_error
  end

  it "should perform a double click on an image" do
    expect { @region.double_click("smiley_face.png") }.not_to raise_error
  end

  it "should perform a drag and drop" do
    expect { @region.drag_drop(12, 12, 491, 491) }.not_to raise_error
  end

  it "should perform a click on an image" do
    expect { @region.click("smiley_face.png") }.not_to raise_error
  end

  it "should not perform a click on an image that is outside of the region" do
    expect { @region.click("apple.png") }.to raise_error(Rukuli::ImageNotFound, "The image 'apple.png' did not match in this region.")
  end

  it "should perform a click and hold on an image" do
    expect { @region.click_and_hold(2, "green_apple.png") }.not_to raise_error
  end

  it "should perform a click and hold on a point" do
    expect { @region.click_and_hold(2, 100, 100) }.not_to raise_error
  end

  it "should simulate a mouse scroll wheel up event" do
    expect { @region.wheel_up(10) }.not_to raise_error
  end

  it "should simulate a mouse scroll wheel down event" do
    expect { @region.wheel_down(10) }.not_to raise_error
  end
end
