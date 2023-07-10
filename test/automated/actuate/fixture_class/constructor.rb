require_relative '../../automated_init'

context "Actuate" do
  context "Fixture Class" do
    context "Constructor" do
      context "No Build Method" do
        fixture_class = Controls::Fixture::Class::NoBuildMethod
        control_constructor = :new

        constructor = Fixture::Actuate::Class.constructor(fixture_class)

        comment constructor.inspect
        detail "Control: #{control_constructor.inspect}"

        test do
          assert(constructor == control_constructor)
        end
      end

      context "Build Method" do
        fixture_class = Controls::Fixture::Class::BuildMethod
        control_constructor = :build

        constructor = Fixture::Actuate::Class.constructor(fixture_class)

        comment constructor.inspect
        detail "Control: #{control_constructor.inspect}"

        test do
          assert(constructor == control_constructor)
        end
      end

      context "Not a Class" do
        object = Object.new

        test "Is an error" do
          assert_raises(Fixture::Actuate::Class::Error) do
            Fixture::Actuate::Class.constructor(object)
          end
        end
      end

      context "Not a Fixture Class" do
        cls = Class.new

        test "Is an error" do
          assert_raises(Fixture::Actuate::Class::Error) do
            Fixture::Actuate::Class.constructor(cls)
          end
        end
      end
    end
  end
end
