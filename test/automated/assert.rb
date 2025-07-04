require_relative 'automated_init'

context "Assert" do
  fixture = Controls::Fixture.example

  context "Affirmative" do
    test "Isn't an error" do
      refute_raises(Session::Failure) do
        fixture.assert(true)
      end
    end
  end

  context "Negative" do
    failure_message = "Assertion failed"

    test "Is an error" do
      assert_raises(Session::Failure, failure_message) do
        fixture.assert(false)
      end
    end
  end

  context "Not a Boolean" do
    value = Object.new

    failure_message = "Assertion given non-boolean value: #{value.inspect}"

    test "Is an error" do
      assert_raises(Session::Failure, failure_message) do
        fixture.assert(value)
      end
    end
  end
end
