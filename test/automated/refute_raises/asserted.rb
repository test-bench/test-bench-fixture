require_relative '../automated_init'

context "Refute Raises" do
  context "Asserted" do
    context "Exception Not Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.refute_raises(Controls::Exception::SomeException) {}
      rescue Session::Failure
      end

      context "Asserted" do
        asserted = fixture.test_session.assertion_sequence > 0

        test do
          assert(asserted)
        end
      end
    end

    context "Exception Raised" do
      fixture = Controls::Fixture.example

      exception = Controls::Exception.example

      begin
        fixture.refute_raises(Controls::Exception::SomeException) do
          raise exception
        end
      rescue Session::Failure
      end

      context "Asserted" do
        asserted = fixture.test_session.assertion_sequence > 0

        test do
          assert(asserted)
        end
      end
    end
  end
end
