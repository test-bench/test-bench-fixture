require_relative 'automated_init'

context "Fixture" do
  fixture = Controls::Fixture.example

  session = Session.new
  fixture.test_session = session

  fixture_class = Controls::Fixture::Example

  control_argument = 'some-argument'
  control_keyword_argument = 'some-keyword-argument'
  control_block_value = 'some-block-value'

  executed_fixture = fixture.fixture(
    fixture_class,
    control_argument,
    some_keyword_argument: control_keyword_argument
  ) do

    control_block_value
  end

  context "Executed Fixture" do
    test! "Actuated" do
      assert(executed_fixture.actuated?)
    end

    context "Arguments" do
      context "Positional Argument" do
        set = executed_fixture.some_argument == control_argument

        test "Set" do
          assert(set)
        end
      end

      context "Keyword Argument" do
        set = executed_fixture.some_keyword_argument == control_keyword_argument

        test "Set" do
          assert(set)
        end
      end

      context "Block Argument" do
        set = executed_fixture.some_block_argument.() == control_block_value

        test "Set" do
          assert(set)
        end
      end
    end

    context "Session Dependency" do
      test "Outer fixture's session" do
        assert(executed_fixture.test_session == session)
      end
    end
  end
end
