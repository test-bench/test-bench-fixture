require_relative '../automated_init'

context "Assert Raises" do
  context "Optional Message" do
    control_message = Controls::Message::Error.example
    exception = Controls::Exception.example(exception_message: control_message)

    context "Corresponds With Exception Message" do
      message = control_message

      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises(Controls::Exception::SomeException, message) do
          raise exception
        end
      rescue Session::Failure => failure
      end

      test "No failure" do
        assert(failure.nil?)
      end
    end

    context "Doesn't Correspond With Exception Message" do
      message = Controls::Message::Error.other_example

      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises(Controls::Exception::SomeException, message) do
          raise exception
        end
      rescue Session::Failure => failure
      end

      test "Failure" do
        refute(failure.nil?)
      end
    end
  end
end
