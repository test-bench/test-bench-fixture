require_relative '../automated_init'

context "Detail" do
  fixture = Controls::Fixture.example

  text = Controls::Text.example

  fixture.detail(text)

  context "Detailed Event" do
    recorded = fixture.test_session.detailed_event?(text)

    test "Recorded" do
      assert(recorded)
    end
  end
end
