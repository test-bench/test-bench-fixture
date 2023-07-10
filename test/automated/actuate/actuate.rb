require_relative '../automated_init'

context "Actuate" do
  context "Fixture Class" do
    fixture_class = Controls::Fixture::Class::Actuator

    fixture = Fixture.(fixture_class)

    test "Builds a fixture" do
      assert(fixture.instance_of?(fixture_class))
    end

    test "Actuates the fixture" do
      assert(fixture.actuated?)
    end
  end

  context "Object" do
    object = Controls::Fixture::Object.example

    effect = nil

    Fixture.(object) do
      effect = :_
    end

    context "Block is executed" do
      executed = !effect.nil?

      test do
        assert(executed)
      end
    end

    context "Object is extended" do
      extended = object.is_a?(Fixture)

      test do
        assert(extended)
      end
    end
  end
end
