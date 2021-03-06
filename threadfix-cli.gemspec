
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "threadfix/cli/version"

Gem::Specification.new do |spec|
  spec.name          = "threadfix-cli"
  spec.version       = Threadfix::Cli::VERSION
  spec.authors       = ["Dave Elliott"]
  spec.email         = ["ddazza@gmail.com"]

  spec.summary       = %q{CLI to upload scan report to ThreadFix}
  spec.description   = %q{Command line tool to upload a static analysis report to ThreadFix}
  spec.homepage      = "https://github.com/DDAZZA/threadfix-cli"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/DDAZZA/threadfix-cli"
    spec.metadata["changelog_uri"] = "https://github.com/DDAZZA/threadfix-cli/blob/master/CHANGE_LOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end
  spec.files = Dir.glob('{bin,lib}/**/**/**')

  spec.bindir        = "bin"
  spec.executables   = "threadfix"
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor", '0.20.3'
  spec.add_runtime_dependency "rest-client", '2.0.2'

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
