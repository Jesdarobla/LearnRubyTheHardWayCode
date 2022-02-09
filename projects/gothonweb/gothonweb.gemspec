#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name         = "NAME"
  spec.version      = '1.0'
  spec.authors      = ["Jesdarobla"]
  spec.email        = ["jesdarobla@gmail.com"]
  spec.summary      = %q{Project summary of short lenght}
  spec.description  = %q{Longer description of project}
  spec.homepage     = "http://domainforproject.com"
  spec.license      = "MIT"

  spec.files         = ['lib/NAME.rb']
  spec.executables   = ['bin/NAME']
  spec.test_files    = ['tests/test_NAME.rb']
  spec.require_paths = ["lib"]
end
