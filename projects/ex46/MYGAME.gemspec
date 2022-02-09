#coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name         = "MYGAME"
  spec.version      = '1.0'
  spec.authors      = ["Jesdarobla"]
  spec.email        = ["jesdarobla@gmail.com"]
  spec.summary      = %q{Project summary of short lenght}
  spec.description  = %q{Longer description of project}
  spec.homepage     = "http://domainforproject.com"

  spec.files         = ['lib/MYGAME.rb']
  spec.executables   = ['MYGAME']
  spec.test_files    = ['tests/test_MYGAME.rb']
  spec.require_paths = ["lib"]
end
