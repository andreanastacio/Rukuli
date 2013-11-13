# Detect the platform we're running on so we can tweak behaviour
# in various places.

module Sikuli
  class Platform

    WINDOWS = RbConfig::CONFIG['host_os'] =~ /mswin/
    LINUX = RbConfig::CONFIG['host_os'] =~ /linux/
    MINGW = RbConfig::CONFIG['host_os'] =~ /mingw/
    OS_X = RbConfig::CONFIG['host_os'] =~ /darwin/

    def self.sikuli_script_path
      if OS_X
        path = "/Applications/Sikuli-IDE.app/Contents/Resources/Java/sikuli-script.jar"
      else
        raise LoadError, no_sikuli_home_err_msg unless ENV['SIKULI_HOME'].nil?
        path = "#{ENV['SIKULI_HOME']}/sikuli-script.jar"
      end
      unless File.exist?(path)
        raise LoadError, "Failed to load '#{path}'\nIs Sikuli installed?"
      end
      path
    end

    private

    def self.no_sikuli_home_err_msg
      err = "Failed to load 'sikuli-script.jar' from the Sikuli home directory"
      return err + "\nMake sure %SIKULI_HOME% is set!" if WINDOWS
      return err + "\nMake sure $SIKULI_HOME is set!" if LINUX
      err + "\nMake sure %SIKULI_HOME% or $SIKULI_HOME is set!"
    end
  end
end
