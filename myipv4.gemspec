# -*- encoding: utf-8 -*-
require File.expand_path('../lib/myipv4/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Christophe Lucas"]
  gem.email         = ["clucas4r@gmail.com"]
  gem.description   = %q{CLI to resolve ip}
  gem.summary       = %q{Simple CLI to verify and display your IP}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "myipv4"
  gem.require_paths = ["lib"]
  gem.version       = Myipv4::VERSION

  gem.add_dependency "em-http-request", "~> 1.0.3"
end
