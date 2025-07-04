require_relative '../automated_init'

context "Detail" do
  context "Optional Heading" do
    fixture = Controls::Fixture.example

    heading_text = Controls::Text.example
    text = Controls::Text::Detail.example

    fixture.detail(heading_text, text)

    context "Heading Detailed Event" do
      heading_detailed = fixture.test_session.one_detailed_event(heading_text)

      test! "Recorded" do
        refute(heading_detailed.nil?)
      end

      context "Disposition Attribute" do
        disposition = heading_detailed.disposition

        heading_style = Output::CommentStyle.heading
        control_disposition = Output::CommentStyle.get_disposition(heading_style)

        detail disposition.inspect
        detail "Control: #{control_disposition.inspect}"

        test do
          assert(disposition == control_disposition)
        end
      end
    end

    context "Detailed Event" do
      recorded = fixture.test_session.one_detailed_event?(text)

      test "Recorded" do
        assert(recorded)
      end
    end
  end
end
