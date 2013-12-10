# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 't50_matriz_dispersa_densa/version'

Gem::Specification.new do |gem|
  gem.name          = "t50_matriz_dispersa_densa"
  gem.version       = T50MatrizDispersaDensa::VERSION
  gem.authors       = ["Javier C"]
  gem.email         = ["alu0100505023@ull.edu.es"]
  gem.description   = %q{"Operaciones con matrices"}
  gem.summary       = %q{"Operaciones con matrices densas y dispersas"}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
