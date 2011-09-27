# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "config_badger/version"

Gem::Specification.new do |s|
  s.name        = "config_badger"
  s.version     = ConfigBadger::VERSION
  s.authors     = ["Rein Henrichs"]
  s.email       = ["rein@phpfog.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "config_badger"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~> 2.6.0"
  s.add_development_dependency "mocha"
  s.add_development_dependency "rdoc", '3.10.pre.1'

  # s.add_runtime_dependency "rest-client"
end
