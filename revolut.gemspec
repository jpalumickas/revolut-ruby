lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revolut/version'

github_repo_url = 'https://github.com/jpalumickas/revolut-ruby'

Gem::Specification.new do |spec|
  spec.name          = 'revolut'
  spec.version       = Revolut::VERSION
  spec.authors       = ['Justas Palumickas']
  spec.email         = ['jpalumickas@gmail.com']

  spec.summary       = 'Ruby wrapper for Revolut API'
  spec.description   = 'Ruby gem for Revolut API'
  spec.homepage      = 'https://github.com/jpalumickas/revolut-ruby'
  spec.license       = 'MIT'
  spec.metadata = {
    'bug_tracker_uri' => "#{github_repo_url}/issues",
    'source_code_uri' => "#{github_repo_url}/tree/v#{Revolut::VERSION}",
    'changelog_uri'   => "#{github_repo_url}/releases/tag/v#{Revolut::VERSION}"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 0.10'
  spec.add_dependency 'faraday_middleware', '~> 0.10'
  spec.add_dependency 'hashie', '~> 3.5.5'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'webmock', '~> 3.4'
end
