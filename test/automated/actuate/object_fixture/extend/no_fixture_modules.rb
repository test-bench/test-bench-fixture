require_relative '../../../automated_init'

context "Actuate" do
  context "Object Fixture" do
    context "Extend" do
      context "No Fixture Modules" do
        object = Object.new

        test "Is an error" do
          assert_raises(Fixture::Actuate::Object::ModuleError) do
            Fixture::Actuate::Object.extend(object)
          end
        end
      end
    end
  end
end
