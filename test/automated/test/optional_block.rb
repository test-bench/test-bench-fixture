require_relative '../automated_init'

context "Test" do
  context "Optional Block Argument" do
    test_title = Controls::Title::Test.example

    context "Given" do
      fixture = Controls::Fixture.example

      fixture.test(test_title) {}

      context "Skipped Event" do
        recorded = fixture.test_session.skipped_event?

        test "Not recorded" do
          refute(recorded)
        end
      end

      context "Test Finished Event" do
        recorded = fixture.test_session.test_finished_event?

        test "Recorded" do
          assert(recorded)
        end
      end
    end

    context "Omitted" do
      fixture = Controls::Fixture.example

      fixture.test(test_title)

      context "Skipped Event" do
        skipped = fixture.test_session.one_skipped_event

        test! "Recorded" do
          refute(skipped.nil?)
        end

        context "Message Attribute" do
          message = skipped.message

          comment message.inspect
          detail "Title: #{test_title.inspect}"

          test "Is the test title" do
            assert(message == test_title)
          end
        end
      end

      context "Test Finished Event" do
        recorded = fixture.test_session.test_finished_event?

        test "Not recorded" do
          refute(recorded)
        end
      end
    end
  end
end
