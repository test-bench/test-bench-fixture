require_relative '../automated_init'

context "Build" do
  control_argument = 'some-argument'
  control_keyword_argument = 'some-keyword-argument'
  control_block_value = 'some-block-value'

  fixture = Fixture::Build.(
    Controls::Fixture::Example,
    control_argument,
    some_keyword_argument: control_keyword_argument
  ) do

    control_block_value
  end

  context "Fixture" do
    context "Positional Argument" do
      set = fixture.some_argument == control_argument

      test "Set" do
        assert(set)
      end
    end

    context "Keyword Argument" do
      set = fixture.some_keyword_argument == control_keyword_argument

      test "Set" do
        assert(set)
      end
    end

    context "Block Argument" do
      set = fixture.some_block_argument.() == control_block_value

      test "Set" do
        assert(set)
      end
    end

    context "Test Session" do
      configured = fixture.test_session.instance_of?(Session)

      test "Configured" do
        assert(configured)
      end
    end
  end
end
