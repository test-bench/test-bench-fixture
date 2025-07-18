# -*- encoding: utf-8 -*-
Gem::Specification.new do |spec|
  spec.name = 'test_bench-fixture'
  spec.version = '3.0.0.0'

  spec.summary = "Pre-defined, reusable test abstractions using TestBench"
  spec.description = <<~TEXT.each_line(chomp: true).map(&:strip).join(' ')
  A TestBench fixture is a pre-defined, reusable test abstraction. By including TestBench::Fixture, any class can use the TestBench
  DSL. Fixture classes are typically actuated as part of another TestBench test, but they can also be exercised and tested in
  isolation.
  TEXT

  spec.homepage = 'http://test-bench.software'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/test-bench-demo/test-bench-fixture'

  allowed_push_host = ENV.fetch('RUBYGEMS_PUBLIC_AUTHORITY') { 'https://rubygems.org' }
  spec.metadata['allowed_push_host'] = allowed_push_host

  spec.metadata['namespace'] = 'TestBench::Fixture'

  spec.license = 'MIT'

  spec.authors = ['Brightworks Digital']
  spec.email = 'development@bright.works'

  spec.require_paths = ['lib']

  spec.files = Dir.glob('lib/**/*')

  spec.platform = Gem::Platform::RUBY

  spec.add_runtime_dependency 'test_bench-output'

  spec.add_development_dependency 'test_bench-bootstrap'
end
