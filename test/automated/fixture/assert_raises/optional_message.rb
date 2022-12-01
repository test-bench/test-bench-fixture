require_relative '../../automated_init'

context "Fixture" do
  context "Assert Raises" do
    context "Optional Message" do
      control_message = Controls::Exception::Message.example
      exception = Controls::Exception.example(message: control_message)

      context "Corresponds With Exception Message" do
        message = control_message

        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises(Controls::Exception::Example, message) do
            raise exception
          end
        rescue Session::Failure => failure
        end

        test "Pass" do
          assert(failure.nil?)
        end
      end

      context "Doesn't Correspond With Exception Message" do
        message = Controls::Exception::Message.random

        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises(Controls::Exception::Example, message) do
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
end
