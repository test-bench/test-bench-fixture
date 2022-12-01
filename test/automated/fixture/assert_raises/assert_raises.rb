require_relative '../../automated_init'

context "Fixture" do
  context "Assert Raises" do
    context "Exception Raised" do
      fixture = Controls::Fixture.example

      exception = Controls::Exception.example

      begin
        fixture.assert_raises(Controls::Exception::Example) do
          raise exception
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

    context "Exception Not Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises(Controls::Exception::Example) do
          #
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
