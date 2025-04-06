Gem::Specification.new do |spec|
  spec.name          = "rubicons"
  spec.version       = Rubicons::VERSION
  spec.authors       = ["insomnius"]
  spec.email         = ["awake@insomnius.dev"]
  spec.summary       = "A brief summary of the rubicons gem."
  spec.description   = "A longer description of the rubicons gem."
  spec.homepage      = "https://github.com/insomnius/rubicons"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*", "bin/*", "README.md", "LICENSE.txt"]
  spec.require_paths  = ["lib"]
end