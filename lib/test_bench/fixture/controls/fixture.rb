module TestBench
  module Fixture
    module Controls
      module Fixture
        def self.example
          Example.new
        end

        class Example
          include TestBench::Fixture
        end
      end
    end
  end
end
