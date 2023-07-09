require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Extend" do
      context "Multiple Modules Given" do
        module_1 = Controls::Fixture::Object::Modules::Included
        module_2 = Controls::Fixture::Object::Modules::Extended

        object = Controls::Fixture::Object.example

        Fixture::Actuate::Object.extend(object, module_1, module_2)

        context "First Module" do
          fixture_module_1 = module_1::Fixture

          extended = object.is_a?(fixture_module_1)

          test "Extended" do
            assert(extended)
          end
        end

        context "Second Module" do
          fixture_module_2 = module_2::Fixture

          extended = object.is_a?(fixture_module_2)

          test "Extended" do
            assert(extended)
          end
        end
      end
    end
  end
end
