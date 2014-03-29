# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "sinatra_git_hooker"
  spec.version       = "0.1"
  spec.authors       = ["Nicolas Ledez"]
  spec.email         = ["rubygems@ledez.net"]
  spec.description   = %q{A Sinatra Git hook to launch pull}
  spec.summary       = %q{An URL hook to launch "git pull"}
  spec.homepage      = "https://github.com/nledez/sinatra_git_hooker"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rack-test"
end
