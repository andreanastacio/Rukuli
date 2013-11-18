require 'spec_helper'

describe Rukuli::Region, "#Searchable" do
  before(:all) do
    @region = setup_test_area
  end

  it "should find an image within the region" do
    @region.find("smiley_face.png").should_not be_nil
  end

  it "should return a region containing the found image" do
    @region.find("smiley_face.png").should be_an_instance_of Rukuli::Region
  end

  it "should raise an error if a file can not be found" do
    lambda { @region.find("no_photo.png") }.should
      raise_error(Rukuli::FileDoesNotExist, "The file 'no_photo.png' does not exist.")
  end

  it "should not find an image that is not in the region" do
    lambda { @region.find("apple.png") }.should
      raise_error(Rukuli::ImageNotFound, "The image 'apple.png' did not match in this region.")
  end

  it "should return true if the image is found" do
    @region.find!("smiley_face.png").should be_an_instance_of Rukuli::Region
  end

  it "should return nil if the image is not found" do
    @region.find!("apple.png").should be_nil
  end

  it "should raise an exception if the file does not exist" do
    lambda { @region.find!("no_photo.png") }.should
      raise_error(Rukuli::FileDoesNotExist, "The file 'no_photo.png' does not exist.")
  end

  context "#wait" do
    it "should raise an error if no match is found after a given time" do
      lambda { @region.wait('apple.png') }.should
        raise_error(Rukuli::ImageNotFound, "The image 'apple.png' did not match in this region.")
    end

    it "should return a Region object when a match is found" do
      match = @region.wait('green_apple.png', 5)
      match.should be_an_instance_of Rukuli::Region
    end
  end

  context "#find_all" do
    before(:all) do
      @matches = @region.find_all("green_apple.png")
    end

    it "should raise an error if no matches are found" do
      lambda { @region.find_all("apple.png") }.should
        raise_error(Rukuli::ImageNotFound, "The image 'apple.png' did not match in this region.")
    end

    it "should return an array" do
      @matches.should be_an_instance_of Array
    end

    it "should contain 4 matches" do
      @matches.length.should == 4
    end

    it "should contain regions" do
      @matches.each do |m|
        m.should be_an_instance_of Rukuli::Region
      end
    end
  end
end
