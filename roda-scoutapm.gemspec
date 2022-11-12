# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "roda/plugins/scoutapm/version"

Gem::Specification.new do |spec|
  spec.name = "roda-scoutapm"
  spec.version = Roda::RodaPlugins::Scoutapm::VERSION
  spec.authors = ["Alexey Ivanov"]
  spec.email = ["a.ivanov@3commas.io"]

  spec.summary = "ScoutApm instrumentation for Roda apps/routes"
  spec.description = "ScoutApm instrumentation for Roda apps/routes"
  spec.homepage = "https://github.com/Alexey2257/roda-scoutapm"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Alexey2257/roda-scoutapm"
  spec.metadata["changelog_uri"] = "https://github.com/Alexey2257/roda-scoutapm/CHANGELOG"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "roda"
  spec.add_dependency "scout_apm"
end
