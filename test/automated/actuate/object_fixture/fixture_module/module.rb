require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Fixture Module" do
      context "Module Given" do
        context "Module Contains a Fixture Module" do
          control_module = Controls::Fixture::Object::Modules::Included

          fixture_module = Fixture::Actuate::Object.fixture_module(control_module)
          control_module = control_module::Fixture

          test do
            assert(fixture_module == control_module)
          end
        end

        context "Module Doesn't Contain a Fixture Module" do
          control_module = Controls::Fixture::Object::Modules::NoFixture

          test "Is an error" do
            assert_raises(Fixture::Actuate::Object::ModuleError) do
              Fixture::Actuate::Object.fixture_module(control_module)
            end
          end
        end
      end
    end
  end
end
