require_relative '../automated_init'

context "Refute Raises" do
  context "No Exception Class" do
    context "Exception Not Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.refute_raises {}
      rescue Session::Failure => failure
      end

      test "No failure" do
        assert(failure.nil?)
      end
    end

    context "Runtime Error Raised" do
      fixture = Controls::Fixture.example

      begin
        fixture.refute_raises do
          raise "Some error"
        end
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
        fixture.refute_raises do
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
