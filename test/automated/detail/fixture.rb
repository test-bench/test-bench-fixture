require_relative '../automated_init'

context "Detail" do
  context "Fixture" do
    text = Controls::Text::Detail.example
    other_text = Controls::Text::Detail.other_example

    other_fixture = Controls::Fixture.example
    other_fixture.detail(text)
    other_fixture.detail(other_text)

    fixture = Controls::Fixture.example

    fixture.detail(other_fixture)

    context "Detailed Event" do
      detailed = fixture.test_session.one_detailed_event

      test! "Recorded" do
        refute(detailed.nil?)
      end

      context "Attributes" do
        context "Text" do
          detail_text = detailed.text

          control_text = <<~TEXT
          #{text}
          #{other_text}
          TEXT

          detail detail_text
          detail "Control:", control_text

          test do
            assert(detail_text == control_text)
          end
        end

        context "Disposition" do
          disposition = detailed.disposition

          block_style = Output::CommentStyle.block
          control_disposition = Output::CommentStyle.get_disposition(block_style)

          detail disposition.inspect
          detail "Control: #{control_disposition.inspect}"

          test do
            assert(disposition == control_disposition)
          end
        end
      end
    end
  end
end
