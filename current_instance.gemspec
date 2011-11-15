# -*- encoding: utf-8 -*-
require File.expand_path('../lib/current_instance/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Quinn"]
  gem.email         = ["chaffeqa@gmail.com"]
  gem.description   = %q{Thread Safe Current Class Instance}
  gem.summary       = <<-DOC
  Thread Safe Current Class Instance. Use Like So:

        class User < ActiveRecord::Base
          include CurrentInstance
        end
  DOC
  gem.homepage      = "https://github.com/chaffeqa/current_instance"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "current_instance"
  gem.require_paths = ["lib"]
  gem.version       = CurrentInstance::VERSION
  
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'minitest'
end
