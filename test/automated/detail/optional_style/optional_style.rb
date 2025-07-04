require_relative '../../automated_init'

context "Detail" do
  context "Optional Style" do
    context "Given" do
      style = Controls::CommentStyle.example

      fixture = Controls::Fixture.example

      fixture.detail(
        Controls::Text.example,
        style:
      )

      context "Detailed Event" do
        detailed = fixture.test_session.one_detailed_event

        context "Disposition Attribute" do
          disposition = detailed.disposition

          control_disposition = Controls::CommentStyle.disposition

          detail disposition.inspect
          detail "Control: #{control_disposition.inspect}"

          test do
            assert(disposition == control_disposition)
          end
        end
      end
    end

    context "Omitted" do
      fixture = Controls::Fixture.example

      fixture.detail(Controls::Text.example)

      context "Detailed Event" do
        detailed = fixture.test_session.one_detailed_event

        context "Disposition Attribute" do
          disposition = detailed.disposition

          detect_style = Output::CommentStyle.detect
          control_disposition = Output::CommentStyle.get_disposition(detect_style)

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
