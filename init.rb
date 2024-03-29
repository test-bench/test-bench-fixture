require_relative './gems/gems_init'

lib_dir = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib_dir) unless $LOAD_PATH.include?(lib_dir)

libraries_dir = ENV['LIBRARIES_HOME']
unless libraries_dir.nil?
  libraries_dir = File.expand_path(libraries_dir)
  $LOAD_PATH.unshift(libraries_dir) unless $LOAD_PATH.include?(libraries_dir)
end

require 'test_bench/fixture'
