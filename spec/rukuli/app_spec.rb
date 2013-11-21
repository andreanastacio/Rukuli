require 'spec_helper'

describe Rukuli::App do
  subject { Rukuli::App.new(application "FILE_EXPLORER") }

  its(:window) { should be_an_instance_of Rukuli::Region }
end
