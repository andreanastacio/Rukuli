require 'spec_helper'

describe Rukuli::Region, 'when initialized with a rectangle' do
  subject { Rukuli::Region.new(10, 15, 250, 400) }
  its(:x) { should == 10 }
  its(:y) { should == 15 }
  its(:width) { should == 250 }
  its(:height) { should == 400 }
end

describe Rukuli::Region, 'when initialzed with a sikuli region' do
  subject { Rukuli::Region.new org.sikuli.script::Region.new(11, 16, 251, 401) }
  its(:x) { should == 11 }
  its(:y) { should == 16 }
  its(:width) { should == 251 }
  its(:height) { should == 401 }
end
