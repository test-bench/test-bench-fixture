require_relative '../automated_init'

context "Assert Raises" do
  context "No Exception Class" do
    context "Runtime Error Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises do
          raise "Some error"
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
        fixture.assert_raises {}
      rescue Session::Failure => failure
      end

      test "Failure" do
        refute(failure.nil?)
      end
    end

    context "Exception Raised" do
      exception = Controls::Exception.example

      fixture = Controls::Fixture.example

      begin
        fixture.assert_raises do
          raise exception
        end
      rescue exception.class => raised_exception
      end

      test "Not rescued" do
        refute(raised_exception.nil?)
      end
    end
  end
end
