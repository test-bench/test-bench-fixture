require_relative '../automated_init'

context "Assert Raises" do
  context "Strictness" do
    exception = Controls::Exception.example

    exception_class = Controls::Exception::SomeException.superclass

    context "Strict" do
      strict = true

      context "Subclass of Given Exception Raised" do
        fixture = Controls::Fixture.example

        begin
          fixture.assert_raises(exception_class, strict:) do
            raise exception
          end
        rescue exception.class => raised_exception
        end

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
          fixture.assert_raises(exception_class, strict:) do
            raise exception
          end
        rescue exception.class => raised_exception
        end

        test "Rescued" do
          assert(raised_exception.nil?)
        end
      end
    end
  end
end
