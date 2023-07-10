require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Extend" do
      context "Optional Modules Given" do
        mod = Controls::Fixture::Object::Modules::Included

        context "Object Includes Given Module" do
          object = Controls::Fixture::Object.example

          Fixture::Actuate::Object.extend(object, mod)

          context "Extends given module's Fixture module" do
            extended = object.is_a?(mod::Fixture)

            test do
              assert(extended)
            end
          end
        end

        context "Object Doesn't Include the Given Module" do
          object = Object.new

          test "Is an error" do
            assert_raises(Fixture::Actuate::Object::ModuleError) do
              Fixture::Actuate::Object.extend(object, mod)
            end
          end
        end
      end
    end
  end
end
