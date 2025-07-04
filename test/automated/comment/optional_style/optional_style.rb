require_relative '../../automated_init'

context "Comment" do
  context "Optional Style" do
    context "Given" do
      style = Controls::CommentStyle.example

      fixture = Controls::Fixture.example

      fixture.comment(
        Controls::Text.example,
        style:
      )

      context "Commented Event" do
        commented = fixture.test_session.one_commented_event

        context "Disposition Attribute" do
          disposition = commented.disposition

          control_disposition = Controls::CommentStyle.disposition

          comment disposition.inspect
          detail "Control: #{control_disposition.inspect}"

          test do
            assert(disposition == control_disposition)
          end
        end
      end
    end

    context "Omitted" do
      fixture = Controls::Fixture.example

      fixture.comment(Controls::Text.example)

      context "Commented Event" do
        commented = fixture.test_session.one_commented_event

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
  end
end
