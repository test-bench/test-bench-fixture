require_relative '../../automated_init'

context "Fixture" do
  context "Refute Raises" do
    context "Exception Not Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.refute_raises(Controls::Exception::Example) do
          #
        end
      rescue Session::Failure => failure
      end

      test "Isn't a test failure" do
        assert(failure.nil?)
      end

      context "Asserted" do
        asserted = fixture.test_session.asserted?

        test do
          assert(asserted)
        end
      end
    end

    context "Exception Raised" do
      fixture = Controls::Fixture.example

      exception = Controls::Exception.example

      begin
        fixture.refute_raises(Controls::Exception::Example) do
          raise exception
        end
      rescue Session::Failure => failure
      end

      test "Is a test failure" do
        refute(failure.nil?)
      end

      context "Asserted" do
        asserted = fixture.test_session.asserted?

        test do
          assert(asserted)
        end
      end
    end
  end
end
