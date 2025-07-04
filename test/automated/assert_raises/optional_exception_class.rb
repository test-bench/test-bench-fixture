require_relative '../automated_init'

context "Assert Raises" do
  context "Optional Exception Class Given" do
    context "Exception Raised" do
      exception = Controls::Exception.example

      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises(Controls::Exception::SomeException) do
          raise exception
        end
      rescue Session::Failure => failure
      end

      test "No failure" do
        assert(failure.nil?)
      end
    end

    context "Exception Not Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises(Controls::Exception::SomeException) {}
      rescue Session::Failure => failure
      end

      test "Failure" do
        refute(failure.nil?)
      end
    end

    context "Different Exception Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises(Controls::Exception::SomeException) do
          raise "Some other error"
        end

      rescue Session::Failure => failure
      rescue RuntimeError => runtime_error
      end

      not_rescued = !runtime_error.nil? && failure.nil?

      test "Not rescued" do
        assert(not_rescued)
      end
    end
  end
end
