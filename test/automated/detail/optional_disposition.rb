require_relative '../automated_init'

context "Detail" do
  context "Optional Disposition" do
    control_disposition = Controls::CommentStyle.disposition

    fixture = Controls::Fixture.example

    fixture.detail(
      Controls::Text.example,
      disposition: control_disposition
    )

    context "Detailed Event" do
      detailed = fixture.test_session.one_detailed_event

      context "Disposition Attribute" do
        disposition = detailed.disposition

        detail disposition.inspect
        detail "Control: #{control_disposition.inspect}"

        test do
          assert(disposition == control_disposition)
        end
      end
    end
  end
end
