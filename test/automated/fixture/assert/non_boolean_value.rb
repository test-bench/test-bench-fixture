require_relative '../../automated_init'

context "Fixture" do
  context "Assert" do
    context "Non Boolean Value" do
      fixture = Controls::Fixture.example

      value = Object.new

      test "Is an error" do
        assert_raises(TypeError) do
          fixture.assert(value)
        end
      end
    end
  end
end
