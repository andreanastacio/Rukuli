module Rukuli
  class Platform

    def self.sikuli_script_path
      path = "#{ENV['SIKULI_HOME']}/sikuli-script.jar"
      if ENV['SIKULI_HOME'].nil?
        raise LoadError, "Failed to load '#{path}'\nIs Sikuli installed?"
      end
      path
    end
  end
end
