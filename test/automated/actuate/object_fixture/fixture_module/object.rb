require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Fixture Module" do
      context "Object Given" do
        context "Class Contains A Fixture Module" do
          object = Controls::Fixture::Object.example

          fixture_module = Fixture::Actuate::Object.fixture_module(object)
          control_module = object.class::Fixture

          comment fixture_module.inspect

          test do
            assert(fixture_module == control_module)
          end
        end

        context "Class Doesn't Contain A Fixture Module" do
          object = Object.new

          test "Is an error" do
            assert_raises(Fixture::Actuate::Object::ModuleError) do
              Fixture::Actuate::Object.fixture_module(object)
            end
          end
        end
      end
    end
  end
end
