module TestBench
  module Fixture
    module Actuate
      module Object
        ModuleError = ::Class.new(RuntimeError)

        def self.fixture_module(object)
          if not fixture_module?(object)
            raise ModuleError, "Couldn't resolve a Fixture module -- #{object.inspect}"
          end

          target = fixture_module_target(object)

          target.const_get(:Fixture, false)
        end

        def self.fixture_module?(object)
          target = fixture_module_target(object)

          target.const_defined?(:Fixture, false)
        end

        def self.fixture_module_target(object)
          if object.is_a?(Module)
            object
          else
            object.class
          end
        end

        def self.included_modules(object)
          modules = (object.class.included_modules | object.singleton_class.included_modules) - ::Object.included_modules
          modules.sort_by(&:name)
        end
      end
    end
  end
end
