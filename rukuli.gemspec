# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rukuli/version"

Gem::Specification.new do |s|
  s.add_development_dependency "rspec"
  s.name        = "rukuli"
  s.version     = Rukuli::VERSION
  s.authors     = ["Chas Lemley", "André Anastácio"]
  s.email       = ["andreluisanastacio@gmail.com"]
  s.homepage    = "https://github.com/andreanastacio/rukuli"
  s.summary     = %q{Ruby wrapper for Sikuli GUI automation library}
  s.description = %q{Sikuli allows you to interact with your application's user interface using image based search to automate user actions.}

  s.rubyforge_project = "rukuli"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
