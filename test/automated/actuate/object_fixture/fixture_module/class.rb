require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Fixture Module" do
      context "Class Given" do
        context "Class Contains A Fixture Module" do
          control_class = Controls::Fixture::Object::Example

          fixture_module = Fixture::Actuate::Object.fixture_module(control_class)
          control_module = control_class::Fixture

          comment fixture_module.inspect

          test do
            assert(fixture_module == control_module)
          end
        end

        context "Class Doesn't Contain A Fixture Module" do
          control_class = Object

          test "Is an error" do
            assert_raises(Fixture::Actuate::Object::ModuleError) do
              Fixture::Actuate::Object.fixture_module(control_class)
            end
          end
        end
      end
    end
  end
end
