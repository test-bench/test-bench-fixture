require_relative '../init'

require 'test_bench_isolated/test_bench'; TestBenchIsolated::TestBench.activate

require 'test_bench/fixture/controls'

include TestBench

Controls = TestBench::Fixture::Controls rescue nil
