require_relative '../../automated_init'

context "Fixture" do
  context "Refute Raises" do
    context "Strictness" do
      exception = Controls::Exception.example

      exception_class = Controls::Exception::Example.superclass

      context "Strict" do
        strict = true

        context "Subclass of Given Exception Raised" do
          fixture = Controls::Fixture.example

          begin
            fixture.refute_raises(exception_class, strict:) do
              raise exception
            end
          rescue Session::Failure => failure
          rescue exception.class => raised_exception
          end

          not_rescued = !raised_exception.nil? && failure.nil?

          test "Not rescued" do
            refute(raised_exception.nil?)
          end
        end
      end

      context "Non-Strict" do
        strict = false

        context "Subclass of Given Exception Raised" do
          fixture = Controls::Fixture.example

          begin
            fixture.refute_raises(exception_class, strict:) do
              raise exception
            end
          rescue Session::Failure => failure
          rescue exception.class => raised_exception
          end

          rescued = !failure.nil? && raised_exception.nil?

          test "Rescued" do
            assert(rescued)
          end
        end
      end
    end
  end
end
