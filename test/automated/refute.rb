require_relative 'automated_init'

context "Refute" do
  fixture = Controls::Fixture.example

  context "Negative" do
    test "Isn't an error" do
      refute_raises(Session::Failure) do
        fixture.refute(false)
      end
    end
  end

  context "Affirmative" do
    failure_message = "Refutation failed"

    test "Is an error" do
      assert_raises(Session::Failure, failure_message) do
        fixture.refute(true)
      end
    end
  end

  context "Not a Boolean" do
    value = Object.new

    failure_message = "Refutation given non-boolean value: #{value.inspect}"

    test "Is an error" do
      assert_raises(Session::Failure, failure_message) do
        fixture.refute(value)
      end
    end
  end
end
