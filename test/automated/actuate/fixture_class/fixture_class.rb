require_relative '../../automated_init'

context "Actuate" do
  context "Fixture Class" do
    context "Fixture Actuator" do
      fixture_class = Controls::Fixture::Class::Actuator

      control_session = Session.new

      fixture = Fixture::Actuate::Class.(fixture_class)

      test "Builds a fixture" do
        assert(fixture.instance_of?(fixture_class))
      end

      test "Actuates the fixture" do
        assert(fixture.actuated?)
      end
    end

    context "Block Actuator" do
      fixture_class = Controls::Fixture::Class::NoActuator

      actuated = false

      fixture = Fixture::Actuate::Class.(fixture_class) do
        actuated = true
      end

      test "Builds a fixture" do
        assert(fixture.instance_of?(fixture_class))
      end

      test "Actuates the fixture" do
        assert(actuated)
      end
    end
  end
end
