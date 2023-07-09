module TestBench
  module Fixture
    module Controls
      module Fixture
        module Class
          Example = Fixture::Example

          class BuildMethod
            include TestBench::Fixture

            attr_accessor :some_argument
            attr_accessor :some_keyword_argument

            def self.build(some_argument=nil, some_keyword_argument: nil)
              instance = new
              instance.some_argument = some_argument
              instance.some_keyword_argument = some_keyword_argument
              instance
            end
          end

          class NoBuildMethod
            include TestBench::Fixture

            attr_reader :some_argument
            attr_reader :some_keyword_argument

            def initialize(some_argument=nil, some_keyword_argument: nil)
              @some_argument = some_argument
              @some_keyword_argument = some_keyword_argument
            end
          end
        end
      end
    end
  end
end
