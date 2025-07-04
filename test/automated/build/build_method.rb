require_relative '../automated_init'

context "Build" do
  context "Fixture Has Build Method" do
    control_argument = 'some-argument-value'
    control_optional_argument = 'some-optional-argument-value'
    control_keyword_argument = 'some-keyword-argument-value'
    control_optional_keyword_argument = 'some-optional-keyword-argument-value'
    control_block_value = 'some-block-value'

    fixture = Fixture::Build.(
      Controls::Fixture::BuildMethod,
      control_argument,
      control_optional_argument,
      some_keyword_argument: control_keyword_argument,
      some_optional_keyword_argument: control_optional_keyword_argument
    ) do

      control_block_value
    end

    [
      ["Positional Argument", fixture.some_argument, control_argument],
      ["Optional Positional Argument", fixture.some_optional_argument, control_optional_argument],
      ["Keyword Argument", fixture.some_keyword_argument, control_keyword_argument],
      ["Optional Keyword Argument", fixture.some_optional_keyword_argument, control_optional_keyword_argument]
    ].each do |context_title, compare_value, control_value|

      context "#{context_title}" do
        comment compare_value.inspect
        detail "Control: #{control_value.inspect}"

        test "Set" do
          assert(compare_value == control_value)
        end
      end
    end

    context "Block Argument" do
      block_argument = fixture.some_block_argument

      set = block_argument.() == control_block_value

      test "Set" do
        assert(set)
      end
    end
  end
end
