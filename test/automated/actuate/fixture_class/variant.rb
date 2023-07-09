require_relative '../../automated_init'

context "Actuat" do
  context "Fixture Class" do
    context "Variant" do
      context "Fixture Actuator" do
        fixture = Controls::Fixture::Class::Actuator.new

        Fixture::Actuate::Class.actuate(fixture)

        test "Fixture is actuated" do
          assert(fixture.actuated?)
        end
      end

      context "Block Actuator" do
        fixture = Controls::Fixture::Class::NoActuator.new

        block_argument = nil
        Fixture::Actuate::Class.actuate(fixture) do |_block_argument|
          block_argument = _block_argument
        end

        test! "Block is executed" do
          refute(block_argument.nil?)
        end

        context "Block Argument" do
          test "Is the fixture" do
            assert(block_argument == fixture)
          end
        end
      end

      context "Fixture And Block Actuators" do
        fixture = Controls::Fixture::Class::Actuator.new
        block_actuator = proc { }

        test "Is an error" do
          assert_raises(Fixture::Actuate::Class::Error) do
            Fixture::Actuate::Class.actuate(fixture, &block_actuator)
          end
        end
      end

      context "No Actuator" do
        fixture = Controls::Fixture::Class::NoActuator.new
        block_actuator = nil

        test "Is an error" do
          assert_raises(Fixture::Actuate::Class::Error) do
            Fixture::Actuate::Class.actuate(fixture, &block_actuator)
          end
        end
      end
    end
  end
end
