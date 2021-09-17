# frozen_string_literal: true

# this file is synced from dry-rb/template-gem project

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "dry-schema-extensions"
  spec.authors       = ["Ian Ker-Seymer"]
  spec.email         = ["i.kerseymer@gmail.com"]
  spec.license       = "MIT"
  spec.version       = "1.0.0" 

  spec.summary       = "OpenAPI and JSON Schema extension for dry-schema"
  spec.description   = <<~TEXT
    Enhances dry-schema with the ability to export convert dry-schemas to OpenAPI definitions.
  TEXT
  spec.homepage      = "https://dry-rb.org/gems/dry-schema"
  spec.files         = Dir["LICENSE", "README.md", "dry-schema-extensions.gemspec", "lib/**/*"]
  spec.bindir        = "bin"
  spec.executables   = []
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.6.0"

  spec.add_runtime_dependency "dry-schema", ">= 1.6.1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
