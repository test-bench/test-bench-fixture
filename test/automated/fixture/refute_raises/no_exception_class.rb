require_relative '../../automated_init'

context "Fixture" do
  context "Refute Raises" do
    context "No Exception Class" do
      context "Pass" do
        fixture = Controls::Fixture.example

        begin
          fixture.refute_raises do
            #
          end
        rescue Session::Failure => failure
        end

        test do
          assert(failure.nil?)
        end
      end

      context "Failure" do
        exception = Controls::Exception.example

        fixture = Controls::Fixture.example

        begin
          fixture.refute_raises do
            raise exception
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
