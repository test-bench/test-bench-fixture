require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Fixture Module Predicate" do
      context "Module Given" do
        context "Module Contains A Fixture Module" do
          control_module = Controls::Fixture::Object::Modules::Included

          fixture_module = Fixture::Actuate::Object.fixture_module?(control_module)

          comment fixture_module.inspect

          test do
            assert(fixture_module)
          end
        end

        context "Module Doesn't Contain A Fixture Module" do
          control_module = Controls::Fixture::Object::Modules::NoFixture

          fixture_module = Fixture::Actuate::Object.fixture_module?(control_module)

          comment fixture_module.inspect

          test do
            refute(fixture_module)
          end
        end
      end
    end
  end
end
