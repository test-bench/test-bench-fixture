module TestBench
  module Fixture
    module Actuate
      module Object
        def self.included_modules(object)
          modules = (object.class.included_modules | object.singleton_class.included_modules) - ::Object.included_modules
          modules.sort_by(&:name)
        end
      end
    end
  end
end
