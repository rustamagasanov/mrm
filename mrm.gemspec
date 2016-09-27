lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mrm/version'

Gem::Specification.new do |s|
  # s.add_development_dependency 'rspec', '~> 3.2'
  s.name        = 'mrm'
  s.date        = '2015-02-19'
  s.summary     = 'Multipurpose Registry Manager'
  s.description = 'Allows to manipulate Docker Registry and more.'
  s.authors     = ['Rustam A. Gasanov']
  s.email       = 'rustamagasanov@gmail.com'
  s.files       = Dir['lib/**/*.rb']
  s.homepage    = 'http://rubygems.org/gems/mrm'
  s.license     = 'MIT'
  s.version     = MRM::Version
  s.executables << 'mrm'
end
