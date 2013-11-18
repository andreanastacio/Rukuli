require 'spec_helper'

describe Rukuli::App do
  subject { Rukuli::App.new('Finder') }

  its(:window) { should be_an_instance_of Rukuli::Region }
end
