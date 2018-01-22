lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spree_sale_price/version'

Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.name          = 'spree_sale_price'
  spec.version       = SpreeSalePrice::VERSION
  spec.authors       = ['Wojtek']
  spec.email         = ['wojtek@praesens.co']

  spec.summary       = 'Add sale price to spree store'
  spec.description   = 'Add sale price to spree store'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spree_version = '>= 3.1.0', '< 4.0'
  spec.add_dependency 'spree_core', spree_version
end
