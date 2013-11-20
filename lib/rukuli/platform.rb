module Rukuli
  class Platform

    def self.sikuli_script_path
      path = "#{ENV['SIKULI_HOME']}/sikuli-script.jar"
      if ENV['SIKULI_HOME'].nil?
        raise LoadError, "Failed to load 'sikuli-script.jar'\nMake sure SIKULI_HOME is set!"
      end
      path
    end
  end
end
