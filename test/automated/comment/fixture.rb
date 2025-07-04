require_relative '../automated_init'

context "Comment" do
  context "Fixture" do
    text = Controls::Text::Comment.example
    other_text = Controls::Text::Comment.other_example

    other_fixture = Controls::Fixture.example
    other_fixture.comment(text)
    other_fixture.comment(other_text)

    fixture = Controls::Fixture.example

    fixture.comment(other_fixture)

    context "Commented Event" do
      commented = fixture.test_session.one_commented_event

      test! "Recorded" do
        refute(commented.nil?)
      end

      context "Attributes" do
        context "Text" do
          comment_text = commented.text

          control_text = <<~TEXT
          #{text}
          #{other_text}
          TEXT

          comment comment_text
          detail "Control:", control_text

          test do
            assert(comment_text == control_text)
          end
        end

        context "Disposition" do
          disposition = commented.disposition

          block_style = Output::CommentStyle.block
          control_disposition = Output::CommentStyle.get_disposition(block_style)

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
