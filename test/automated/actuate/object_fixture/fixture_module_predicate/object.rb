require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Fixture Module Predicate" do
      context "Object Given" do
        context "Class Contains A Fixture Module" do
          control_object = Controls::Fixture::Object.example

          fixture_module = Fixture::Actuate::Object.fixture_module?(control_object)

          comment fixture_module.inspect

          test do
            assert(fixture_module)
          end
        end

        context "Class Doesn't Contain A Fixture Module" do
          control_object = Object.new

          fixture_module = Fixture::Actuate::Object.fixture_module?(control_object)

          comment fixture_module.inspect

          test do
            refute(fixture_module)
          end
        end
      end
    end
  end
end
