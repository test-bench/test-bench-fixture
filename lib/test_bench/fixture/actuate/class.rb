module TestBench
  module Fixture
    module Actuate
      module Class
        Error = ::Class.new(RuntimeError)

        def self.test_block?(fixture_class)
          assure_fixture(fixture_class)

          constructor = constructor(fixture_class)

          if constructor == :build
            constructor_method = fixture_class.method(:build)
          else
            constructor_method = fixture_class.instance_method(:initialize)
          end

          constructor_parameters = constructor_method.parameters

          constructor_parameters.any? do |(type, _)|
            type == :block
          end
        end

        def self.constructor(fixture_class)
          assure_fixture(fixture_class)

          if fixture_class.respond_to?(:build)
            :build
          else
            :new
          end
        end

        def self.assure_fixture(fixture_class)
          is_class = fixture_class.instance_of?(::Class)

          if not is_class
            raise Error, "Not a class (Class: #{fixture_class})"
          end

          if is_class
            is_fixture_class = fixture_class.included_modules.include?(Fixture)
          end

          if not is_fixture_class
            raise Error, "Not a fixture class (Class: #{fixture_class})"
          end
        end
      end
    end
  end
end
