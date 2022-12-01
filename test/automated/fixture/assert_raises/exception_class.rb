require_relative '../../automated_init'

context "Fixture" do
  context "Assert Raises" do
    context "Exception Class" do
      context "Pass" do
        exception = Controls::Exception.example

        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises(Controls::Exception::Example) do
            raise exception
          end
        rescue Session::Failure => failure
        end

        test do
          assert(failure.nil?)
        end
      end

      context "Failure" do
        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises(Controls::Exception::Example) do
            #
          end
        rescue Session::Failure => failure
        end

        test do
          refute(failure.nil?)
        end
      end

      context "Different Exception Raised" do
        exception = Controls::Exception.other_example

        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises(Controls::Exception::Example) do
            raise exception
          end
        rescue Session::Failure => failure
        rescue exception.class => raised_exception
        end

        not_rescued = !raised_exception.nil? && failure.nil?

        test "Not rescued" do
          assert(not_rescued)
        end
      end
    end
  end
end
