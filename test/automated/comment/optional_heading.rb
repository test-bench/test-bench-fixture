require_relative '../automated_init'

context "Comment" do
  context "Optional Heading" do
    fixture = Controls::Fixture.example

    heading_text = Controls::Text.example
    text = Controls::Text::Comment.example

    fixture.comment(heading_text, text)

    context "Heading Commented Event" do
      heading_commented = fixture.test_session.one_commented_event(heading_text)

      test! "Recorded" do
        refute(heading_commented.nil?)
      end

      context "Disposition Attribute" do
        disposition = heading_commented.disposition

        heading_style = Output::CommentStyle.heading
        control_disposition = Output::CommentStyle.get_disposition(heading_style)

        comment disposition.inspect
        detail "Control: #{control_disposition.inspect}"

        test do
          assert(disposition == control_disposition)
        end
      end
    end

    context "Commented Event" do
      recorded = fixture.test_session.one_commented_event?(text)

      test "Recorded" do
        assert(recorded)
      end
    end
  end
end
