require_relative '../automated_init'

context "Comment" do
  fixture = Controls::Fixture.example

  text = Controls::Text.example

  fixture.comment(text)

  context "Commented Event" do
    recorded = fixture.test_session.commented_event?(text)

    test "Recorded" do
      assert(recorded)
    end
  end
end
