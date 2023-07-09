require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Extend" do
      object = Controls::Fixture::Object.example

      Fixture::Actuate::Object.extend(object)

      context "Fixture" do
        extended = object.is_a?(Fixture)

        test "Extended" do
          assert(extended)
        end
      end

      context "Included Module's Fixture Module" do
        included_module = Controls::Fixture::Object::Modules::Included
        fixture_module = included_module::Fixture

        extended = object.is_a?(fixture_module)

        test "Extended" do
          assert(extended)
        end
      end

      context "Extended Module's Fixture Module" do
        extended_module = Controls::Fixture::Object::Modules::Extended
        fixture_module = extended_module::Fixture

        extended = object.is_a?(fixture_module)

        test "Extended" do
          assert(extended)
        end
      end
    end
  end
end
