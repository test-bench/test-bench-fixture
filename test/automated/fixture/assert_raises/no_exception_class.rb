require_relative '../../automated_init'

context "Fixture" do
  context "Assert Raises" do
    context "No Exception Class" do
      context "Pass" do
        exception = Controls::Exception.example

        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises do
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
          fixture.assert_raises do
            #
          end
        rescue Session::Failure => failure
        end

        test do
          refute(failure.nil?)
        end
      end
    end
  end
end
