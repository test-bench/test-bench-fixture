require_relative '../automated_init'

context "Comment" do
  context "Optional Disposition" do
    control_disposition = Controls::CommentStyle.disposition

    fixture = Controls::Fixture.example

    fixture.comment(
      Controls::Text.example,
      disposition: control_disposition
    )

    context "Commented Event" do
      commented = fixture.test_session.one_commented_event

      context "Disposition Attribute" do
        disposition = commented.disposition

        comment disposition.inspect
        detail "Control: #{control_disposition.inspect}"

        test do
          assert(disposition == control_disposition)
        end
      end
    end
  end
end
