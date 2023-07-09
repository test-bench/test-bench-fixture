module TestBench
  module Fixture
    module Controls
      module Fixture
        module Object
          def self.example
            object = Example.new
            object.extend(Modules::Extended)
            object
          end

          class Example
            include Modules::Included
            include Modules::NoFixture

            module Fixture
            end
          end
        end
      end
    end
  end
end
