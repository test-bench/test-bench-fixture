require_relative '../automated_init'

context "Build" do
  context "Fixture Doesn't Have Build Method" do
    control_argument = 'some-argument-value'

    fixture = Fixture::Build.(
      Controls::Fixture::NoBuildMethod,
      control_argument
    )

    context "Arguments" do
      argument = fixture.some_argument

      set = argument == control_argument

      test "Set" do
        assert(set)
      end
    end
  end
end
