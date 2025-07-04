require_relative '../automated_init'

context "Comment" do
  context "Fixture" do
    context "String Coercion" do
      context "Argument Implements to_str" do
        fixture = Controls::Fixture.example

        text = Controls::Text.example

        object = Struct.new(:to_str).new(text)

        test! "Isn't a type error" do
          refute_raises(TypeError) do
            fixture.comment(object)
          end
        end

        context "Commented Event" do
          commented = fixture.test_session.one_commented_event

          test! do
            refute(commented.nil?)
          end

          context "Disposition Attribute" do
            disposition = commented.disposition

            detect_style = Output::CommentStyle.detect
            control_disposition = Output::CommentStyle.get_disposition(detect_style)

            comment disposition.inspect
            detail "Control: #{control_disposition.inspect}"

            test do
              assert(disposition == control_disposition)
            end
          end
        end
      end

      context "Argument Doesn't Implement to_str" do
        fixture = Controls::Fixture.example

        object = Object.new

        begin
          # Raises a TypeError in order to capture the exception message
          '' + object
        rescue TypeError => type_error
          control_message = type_error.message
        end

        test "Is a type error" do
          assert_raises(TypeError, control_message) do
            fixture.comment(object)
          end
        end
      end
    end
  end
end
