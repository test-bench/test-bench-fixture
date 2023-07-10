require_relative '../../../automated_init'

context "Actuate" do
  context "Fixture Class" do
    context "Build Fixture" do
      context "Build Method" do
        fixture_class = Controls::Fixture::Class::BuildMethod

        control_argument = 'some-argument-value'
        control_keyword_argument = 'some-keyword-argument-value'

        fixture = Fixture::Actuate::Class.build_fixture(fixture_class, control_argument, some_keyword_argument: control_keyword_argument)

        context "Positional Argument" do
          argument = fixture.some_argument

          test "Supplied to fixture" do
            assert(argument == control_argument)
          end
        end

        context "Keyword Argument" do
          keyword_argument = fixture.some_keyword_argument

          test "Supplied to fixture" do
            assert(keyword_argument == control_keyword_argument)
          end
        end
      end
    end
  end
end
