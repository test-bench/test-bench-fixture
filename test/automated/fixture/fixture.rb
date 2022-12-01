require_relative '../automated_init'

context "Fixture" do
  context "Fixture Instance Method" do
    outer_fixture = Controls::Fixture.example

    fixture_class = Controls::Fixture::Class::Actuator

    executed_fixture = outer_fixture.fixture(fixture_class)

    test! do
      assert(executed_fixture.instance_of?(fixture_class))
    end

    test "Actuates the fixture" do
      assert(executed_fixture.actuated?)
    end

    context "Session Dependency" do
      test "Outer fixture's session" do
        assert(executed_fixture.test_session == outer_fixture.test_session)
      end
    end
  end
end
